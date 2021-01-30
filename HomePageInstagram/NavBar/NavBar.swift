//
//  NavBar.swift
//  HomePageInstagram
//
//  Created by Korlan Omarova on 29.01.2021.
//

import UIKit

@objc protocol NavBarDelegate: class{
    @objc optional func heartAction()
    @objc optional func sendAction()
}

@IBDesignable
class NavBar: UIView {
    
    weak var delegate: NavBarDelegate?
    
    @IBOutlet var navBarView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    lazy var isCheckedLikes: Bool = false {
        didSet {
            if isCheckedLikes == true {
                heartButton.setImage(UIImage(named: "heart_fill"), for: .normal)
            } else {
                heartButton.setImage(UIImage(named:"heart"), for: .normal)
            }
        }
    }
    
    lazy var isCheckedDirect: Bool = false {
        didSet {
            if isCheckedDirect == true {
                sendButton.setImage(UIImage(named: "send_fill"), for: .normal)
            } else {
                sendButton.setImage(UIImage(named:"send"), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: NavBar.self)
        bundle.loadNibNamed("NavBar", owner: self, options: nil)
        addSubview(navBarView)
        navBarView.frame = self.bounds
        navBarView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    @IBAction func likeButtonPressed(sender: UIButton){
        delegate?.heartAction?()
        isCheckedLikes = !isCheckedLikes
    }
    @IBAction func directButtonPressed(sender: UIButton){
        delegate?.sendAction?()
        isCheckedDirect = !isCheckedDirect
    }
}
