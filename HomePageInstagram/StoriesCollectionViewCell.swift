//
//  StoriesCollectionViewCell.swift
//  HomePageInstagram
//
//  Created by Korlan Omarova on 30.01.2021.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeImageRound()
        
    }
    
    func makeImageRound(){
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
}
