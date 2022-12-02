//
//  NotificationViewController.swift
//  hack_challenge
//
//  Created by Helen Lei on 11/30/22.
//

import UIKit
import SnapKit

class NotificationViewController: UIViewController {
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    let borderColor = CGColor(red: 0.678, green: 0.757, blue: 0.502, alpha: 1.0)
    
    let notifReuseIdentifier: String = "notifReuseIdentifier"
    
    var notifs: [Dog] = []
    
    var collectionView1: UICollectionView!
    let spacing:CGFloat = 10
    
    var homeButton = UIButton()
    var notifButton = UIButton()
    var profileButton = UIButton()
    
    let dog1 = Dog(id: 1, age: 12, bio: "asdfasdf", name: "Buddy", images: [])
    let dog2 = Dog(id: 2, age: 6, bio: "likes walks", name: "Spot", images: [])
    let dog3 = Dog(id: 3, age: 2, bio: "likes runs", name: "Summer", images: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        title = "Notifications"
        self.navigationItem.hidesBackButton = true
        
        notifs = [dog1, dog2, dog3]
        
        let notiflayout = UICollectionViewFlowLayout()
        notiflayout.minimumLineSpacing = spacing
        notiflayout.minimumInteritemSpacing = spacing
        notiflayout.scrollDirection = .vertical
        
        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: notiflayout)
        collectionView1.backgroundColor = bgGreen
        collectionView1.register(NotificationCollectionViewCell.self, forCellWithReuseIdentifier: notifReuseIdentifier)
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.dataSource = self
        collectionView1.delegate = self
        view.addSubview(collectionView1)
        
        homeButton.contentMode = .scaleAspectFill
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.backgroundColor = lighterGreen
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = borderColor
        homeButton.addTarget(self, action: #selector(popDetailedView), for:.touchUpInside)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        
        profileButton.contentMode = .scaleAspectFill
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
        profileButton.backgroundColor = lighterGreen
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = borderColor
        //profileButton.addTarget(self, action: #selector(presentProfile), for:.touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        notifButton.contentMode = .scaleAspectFill
        notifButton.setImage(UIImage(named: "notifications"), for: .normal)
        notifButton.backgroundColor = lighterGreen
        notifButton.layer.borderWidth = 1
        notifButton.layer.borderColor = borderColor
        //homeButton.addTarget(self, action: #selector(presentView), for:.touchUpInside)
        notifButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notifButton)
        
        homeButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp_bottomMargin)
            make.left.equalTo(view.snp.left)
            make.height.equalTo(60)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
        profileButton.snp.makeConstraints { (make) in
            make.top.equalTo(homeButton.snp.top)
            make.bottom.equalTo(homeButton.snp.bottom)
            make.left.equalTo(homeButton.snp.right)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
        notifButton.snp.makeConstraints { (make) in
            make.top.equalTo(homeButton.snp.top)
            make.bottom.equalTo(homeButton.snp.bottom)
            make.left.equalTo(profileButton.snp.right)
            make.width.equalTo(view.snp.width).multipliedBy(0.333)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: collectionViewPadding),
            collectionView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
    
}
extension NotificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notifs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: notifReuseIdentifier, for: indexPath) as? NotificationCollectionViewCell {
            cell.configureNotifs(match: notifs[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailedViewController(dog: notifs[indexPath.row]), animated: true)
    }
    
    @objc func popDetailedView() {
        navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView1.frame.width - 10
        return CGSize(width: size, height: size/5)
    }
}

