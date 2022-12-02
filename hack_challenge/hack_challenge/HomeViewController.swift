//
//  HomeViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit
import SnapKit

class HomeViewController: ViewController {

    let filterBg = UIColor(red: 0.98, green: 0.929, blue: 0.804, alpha: 1.0)
    let borderColor = CGColor(red: 0.678, green: 0.757, blue: 0.502, alpha: 1.0)
    
    //let refreshControl = UIRefreshControl()

    //size: 0 = small, 1 = medium, 2 = big
    //volume: 3 = quiet, 4 = loud
//    let dog1 = Dog(dogImage: "dog", dogName: "Buddy", dogDescription: "Likes long walks", displayed: true, dogAge: 2 )
//    let dog2 = Dog(dogImage: "dog2", dogName: "Spot", dogDescription: "Likes long walks", displayed: true, dogAge: 3 )
//    let dog3 = Dog(dogImage: "dog3", dogName: "Summer", dogDescription: "Likes long walks", displayed: true, dogAge: 10 )
//    let dog4 = Dog(dogImage: "dog4", dogName: "Cat", dogDescription: "Likes long walks", displayed: true, dogAge: 5 )
//    let dog5 = Dog(dogImage: "dog5", dogName: "Winter", dogDescription: "Likes long walks", displayed: true, dogAge: 12 )
    
//    let smallFilter = UILabel()
//    let mediumFilter = UILabel()
//    let largeFilter = UILabel()
//    let quietFilter = UILabel()
//    let loudFilter = UILabel()
//
//    let filter1 = Filter(select: false)
//    let filter2 = Filter(select: false)
//    let filter3 = Filter(select: false)
//    let filter4 = Filter(select: false)
//    let filter5 = Filter(select: false)
    
    //refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

    var dogs: [Dog] = []
    var selectedDogs: [Dog] = []
    var allfilters: [UILabel] = []
    var filterTracker: [Filter] = []
    
    var collectionView1: UICollectionView!
    var collectionView2: UICollectionView!
    let spacing: CGFloat = 10
    
    let dogReuseIdentifier: String = "dogReuseIdentifier"
    let filterReuseIdentifier: String = "filterReuseIdentifier"
    
    var homeButton = UIButton()
    var notifButton = UIButton()
    var profileButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Furever Friends"
        view.backgroundColor = bgGreen

//        dogs = [dog1, dog2, dog3, dog4, dog5]
//        selectedDogs = [dog1, dog2, dog3, dog4, dog5]
//        allfilters = [smallFilter, mediumFilter, largeFilter, quietFilter, loudFilter]
//        filterTracker = [filter1, filter2, filter3, filter4, filter5]
//
//        smallFilter.text = "small"
//        smallFilter.textColor = .black
//        smallFilter.backgroundColor = filterBg
//        mediumFilter.text = "medium"
//        mediumFilter.textColor = .black
//        mediumFilter.backgroundColor = filterBg
//        largeFilter.text = "large"
//        largeFilter.textColor = .black
//        largeFilter.backgroundColor = filterBg
//        quietFilter.text = "quiet"
//        quietFilter.textColor = .black
//        quietFilter.backgroundColor = filterBg
//        loudFilter.text = "loud"
//        loudFilter.textColor = .black
//        loudFilter.backgroundColor = filterBg


        let doglayout = UICollectionViewFlowLayout()
        doglayout.minimumLineSpacing = spacing
        doglayout.minimumInteritemSpacing = spacing
        doglayout.scrollDirection = .vertical

        collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: doglayout)
        collectionView1.register(DogsCollectionViewCell.self, forCellWithReuseIdentifier: dogReuseIdentifier)
        collectionView1.backgroundColor = bgGreen
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        collectionView1.dataSource = self
        collectionView1.delegate = self
        view.addSubview(collectionView1)
        
//        let filterlayout = UICollectionViewFlowLayout()
//        filterlayout.minimumLineSpacing = spacing
//        filterlayout.minimumInteritemSpacing = spacing
//        filterlayout.scrollDirection = .horizontal
//
//        collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: filterlayout)
//        collectionView2.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
//        collectionView2.delegate = self
//        collectionView2.dataSource = self
//        collectionView2.backgroundColor = bgGreen
//        collectionView2.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(collectionView2)
//
//
        homeButton.contentMode = .scaleAspectFill
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.backgroundColor = lighterGreen
        homeButton.layer.borderWidth = 1
        homeButton.layer.borderColor = borderColor
        //homeButton.addTarget(self, action: #selector(presentView), for:.touchUpInside)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(homeButton)
        
        profileButton.contentMode = .scaleAspectFill
        profileButton.setImage(UIImage(named: "profile"), for: .normal)
        profileButton.backgroundColor = lighterGreen
        profileButton.layer.borderWidth = 1
        profileButton.layer.borderColor = borderColor
        profileButton.addTarget(self, action: #selector(presentProfile), for:.touchUpInside)
        //avatarButton.setImage(avatarImage, for: .normal)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileButton)
        
        notifButton.contentMode = .scaleAspectFill
        notifButton.setImage(UIImage(named: "notifications"), for: .normal)
        notifButton.backgroundColor = lighterGreen
        notifButton.layer.borderWidth = 1
        notifButton.layer.borderColor = borderColor
        notifButton.addTarget(self, action: #selector(presentNotifications), for:.touchUpInside)
        //avatarButton.setImage(avatarImage, for: .normal)
        notifButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notifButton)
        
        let collectionViewPadding: CGFloat =  12
        let collectionViewPadding2: CGFloat = 25
//        collectionView2.snp.makeConstraints { (make) in
//            make.top.equalTo(view.snp_topMargin).offset(collectionViewPadding)
//            make.bottom.equalTo(collectionView2.snp_topMargin).offset(35)
//            make.left.equalTo(view.snp.leftMargin)
//            make.right.equalTo(view.snp.rightMargin)
//        }
        collectionView1.snp.makeConstraints { (make) in
//            make.top.equalTo(collectionView2.snp_bottomMargin).offset(collectionViewPadding2)
            make.top.equalTo(view.snp_topMargin).offset(collectionViewPadding)
            make.bottom.equalTo(homeButton.snp.top).offset(-collectionViewPadding)
            make.left.equalTo(view.snp.left).offset(collectionViewPadding2)
            make.right.equalTo(view.snp.right).offset(-collectionViewPadding2)
        }
        
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
        
        createDummyData()
        
//        setupConstraints()
    }
    func createDummyData() {
        NetworkManager.getAllUsers { dog in
            self.dogs = dog
            self.selectedDogs = self.dogs
            self.collectionView1.reloadData()
        }
    }
    @objc func presentProfile() {
        let pvc = ProfileViewController()
        navigationController?.pushViewController(pvc, animated: true)
    }
    @objc func presentNotifications() {
        navigationController?.pushViewController(NotificationViewController(), animated: true)
    }

//    func filterDogs()  {
//        selectedDogs = []
//        for dog in dogs {
//            dog.displayed = false
//        }
//        var counter = 0
//        for num in 0...2 {
//            if filterTracker[num].select {
//                counter += 1
//                for dog in dogs {
//                    if dog.dogSize == num {
//                        if !(dog.displayed) {
//                            selectedDogs.append(dog)
//                            dog.displayed = true
//                        }
//                    }
//                }
//            }
//        }
//        for num in 3...4 {
//            if filterTracker[num].select {
//                counter += 1
//                for dog in dogs {
//                    if dog.dogVolume == num {
//                        if !(dog.displayed) {
//                            selectedDogs.append(dog)
//                            dog.displayed = true
//                        }
//                    }
//                }
//            }
//        }
//        if counter == 0 || counter == 5 {
//            selectedDogs = dogs
//        }
//    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if collectionView == collectionView2 {
        //            return allfilters.count
        //        }
        //        else {
        //            return selectedDogs.count
        //        }
        return selectedDogs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == collectionView1 {
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dogReuseIdentifier, for: indexPath) as? DogsCollectionViewCell {
//                cell.configure(dog: selectedDogs[indexPath.row])
//                return cell
//            } else {
//                return UICollectionViewCell()
//            }
//        }
        //        else {
        //            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell {
        //                cell.configure(filter: allfilters[indexPath.row])
        //                return cell
        //            }
        //            else {
        //                return UICollectionViewCell()
        //            }
        //        }
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dogReuseIdentifier, for: indexPath) as? DogsCollectionViewCell {
            cell.configure(dog: selectedDogs[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailedViewController(dog: selectedDogs[indexPath.row]), animated: true)
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == collectionView1 {
//            let size = (collectionView.frame.width-20)/2
//            return CGSize(width: size, height: size)
//        }
        let size = (collectionView.frame.width-20)/2
        return CGSize(width: size, height: size)
//        else {
//            let size = (collectionView.frame.width)/3
//            return CGSize(width: size, height: size/1.5)
//        }
        
    }
}



//        if collectionView == collectionView2 {
//            if filterTracker[indexPath.row].select == true {
//                filterTracker[indexPath.row].select = false
//                allfilters[indexPath.row].backgroundColor = filterBg
//                filterDogs()
//            }
//            else {
//                filterTracker[indexPath.row].select = true
//                allfilters[indexPath.row].backgroundColor = .white
//                filterDogs()
//            }
//            collectionView1.reloadData()
//            collectionView2.reloadData()
//        }
//        else {
//            navigationController?.pushViewController(DetailedViewController(dog: selectedDogs[indexPath.row]), animated: true)
//
//        }
