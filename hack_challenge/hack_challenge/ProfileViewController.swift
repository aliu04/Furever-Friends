//
//  ProfileViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var homeButton = UIButton()
    var notifButton = UIButton()
    var profileButton = UIButton()
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    let borderColor = CGColor(red: 0.678, green: 0.757, blue: 0.502, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        title = "Profile"
        self.navigationItem.hidesBackButton = true
        
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
    }

}

