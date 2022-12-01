//
//  EditViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-30.
//

import UIKit

class EditViewController: UIViewController {
    
    let bgGreen = UIColor(red: 0.867, green: 0.898, blue: 0.714, alpha: 1.0)
    let lighterGreen = UIColor(red: 0.914, green: 0.929, blue: 0.788, alpha: 1.0)
    let darkGreen = UIColor(red: 0.157, green: 0.212, blue: 0.094, alpha: 1.0)
    
    var pageTitle = UILabel()
    var editImage = UIButton()
    var editName = UITextField()
    var editBio = UITextField()
    var editAge = UITextField()
    
    var saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgGreen
        
        pageTitle.text = "Edit Profile"
        
        saveButton.setTitle("Done", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.borderColor = UIColor.white.cgColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        saveButton.backgroundColor = darkGreen
        saveButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        let padding = 15
        
        saveButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin).offset(padding)
            make.right.equalTo(view.snp.rightMargin).offset(-padding)
        }
    }
    
    @objc func saveChanges() {
        dismiss(animated: true)
    }

}
