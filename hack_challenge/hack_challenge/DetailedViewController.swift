//
//  DetailedViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-29.
//

import UIKit
import SnapKit

class DetailedViewController: UIViewController {
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    
    var descriptionBox = UIView(frame: .zero)
    
    var selectedDog: Dog
    let dogPic = UIImageView()
    let dogDesc = UITextView()
    let dogNameLabel = UILabel()
    let dogAgeLabel = UILabel()
    let dogAgeNumber = UILabel()
    
    //weak var delegate: detailedInfoDelegate?
    
    init(dog: Dog ) {
        //delegate = inputDelegate
        self.selectedDog = dog
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        title = "Profile"
        
        descriptionBox.backgroundColor = .white
        descriptionBox.layer.cornerRadius = 15
        view.addSubview(descriptionBox)
        
        dogPic.image = UIImage(named: selectedDog.dogImage)
        dogPic.contentMode = .scaleAspectFit
        dogPic.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogPic)
        
        dogDesc.text = selectedDog.dogDescription
        dogDesc.textColor = .black
        dogDesc.textAlignment = .left
        dogDesc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogDesc)
        
        dogNameLabel.text = selectedDog.dogName
        dogNameLabel.font = .systemFont(ofSize: 25, weight: .bold)
        dogNameLabel.textColor = .black
        dogNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogNameLabel)
        
        dogAgeLabel.text = "Age: "
        dogAgeLabel.font = .systemFont(ofSize: 20, weight: .bold)
        dogAgeLabel.textColor = .black
        dogAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogAgeLabel)
        
        dogAgeNumber.text = String(selectedDog.dogAge)
        dogAgeNumber.font = .systemFont(ofSize: 18, weight: .bold)
        dogAgeNumber.textColor = .black
        dogAgeNumber.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogAgeNumber)
        
        
        let padding = 15
        dogPic.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp_topMargin).offset(padding)
            make.left.equalTo(view.snp_leftMargin)
            make.right.equalTo(view.snp_rightMargin)
            make.height.equalTo(200)
        }
        descriptionBox.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp_bottomMargin).offset(-padding)
            make.left.equalTo(view.snp_leftMargin).offset(padding)
            make.right.equalTo(view.snp_rightMargin).offset(-padding)
            make.top.equalTo(dogPic.snp_bottomMargin).offset(20)
        }
        dogNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionBox.snp_topMargin).offset(10)
            make.leftMargin.equalTo(descriptionBox.snp_leftMargin).offset(padding)
        }
        dogAgeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dogNameLabel.snp_bottomMargin).offset(padding)
            make.leftMargin.equalTo(dogNameLabel.snp_leftMargin)
        }
        dogAgeNumber.snp.makeConstraints { (make) in
            make.centerY.equalTo(dogAgeLabel.snp.centerY)
            make.left.equalTo(dogAgeLabel.snp.right).offset(5)
        }
        dogDesc.snp.makeConstraints { (make) in
            make.bottom.equalTo(descriptionBox.snp_bottomMargin).offset(-padding)
            make.left.equalTo(dogAgeLabel.snp.left)
            make.right.equalTo(view.snp_rightMargin).offset(-padding)
            make.top.equalTo(dogAgeLabel.snp_bottomMargin).offset(20)
        }

    }
}

//protocol detailedInfoDelegate: UIViewController {
//    func seeInfo()
//}
