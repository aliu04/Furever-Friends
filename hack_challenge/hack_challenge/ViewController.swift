//
//  ViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    
    var nameLabel = UILabel()
    var paw = UIImageView()
    var enterButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        

        
        nameLabel.text = "Furever Friends"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        paw.image = UIImage(named: "paw")
        paw.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(paw)
        
        enterButton.setTitle("enter", for: .normal)
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.backgroundColor = darkGreen
        enterButton.layer.borderWidth = 1
        //enterButton.layer.borderColor = darkGreen
        enterButton.layer.cornerRadius = 5
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.addTarget(self, action: #selector(homeView), for: .touchUpInside)
        view.addSubview(enterButton)
        
        let spacing = 100
        let padding = 25
        paw.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 150, height: 150))
            make.top.equalTo(view.snp_topMargin).offset(spacing)
            make.centerX.equalTo(view.snp.centerX)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(paw.snp_bottomMargin).offset(padding)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        enterButton.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(padding)
            make.centerX.equalTo(view.snp.centerX)
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        
    }
    
    @objc func homeView() {
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }

}

