//
//  NotificationViewController.swift
//  hack_challenge
//
//  Created by Helen Lei on 11/30/22.
//

import UIKit

class NotificationViewController: UIViewController {
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    
    let notifReuseIdentifier: String = "notifReuseIdentifier"
    
    var notifs: [Dog] = []
    
    var collectionView1: UICollectionView!
    let spacing:CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        title = "Notifications"
        
        let notiflayout = UICollectionViewFlowLayout()
        notiflayout.minimumLineSpacing = spacing
        notiflayout.minimumInteritemSpacing = spacing
        notiflayout.scrollDirection = .vertical
        
        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: notiflayout)
        collectionView1.register(NotificationCollectionViewCell.self, forCellWithReuseIdentifier: notifReuseIdentifier)
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.dataSource = self
        collectionView1.delegate = self
        view.addSubview(collectionView1)
        
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
    }
    
    extension NotificationViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = (collectionView1.frame.width - 10) / 2.0
            return CGSize(width: size, height: size)
        }
    }

}
