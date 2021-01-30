//
//  ViewController.swift
//  HomePageInstagram
//
//  Created by Korlan Omarova on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navBar: NavBar!
    
    var users = [Users(name: "Koko", image: "avatar1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1"), Users(name: "Koko", image: "ava1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
}

extension ViewController: NavBarDelegate{
    func heartAction() {
        print("Likes Button Tapped")
    }
    func sendAction() {
        print("Direct Button Tapped")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCollectionViewCell
        let user = users[indexPath.row]
        cell.imageView.image = UIImage(named: user.image)
        cell.textLabel.text = user.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 128)
    }
    
    
}
