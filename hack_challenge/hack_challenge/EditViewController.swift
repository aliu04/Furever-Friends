//
//  EditViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-30.
//

import UIKit

class EditViewController: UIViewController {
    
    var editImage = UIButton()
    var editName = UITextField()
    var editBio = UITextField()
    var editAge = UITextField()
    
    var saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        title = "Hello Helen"
        
        saveButton.setTitle("Done", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.borderColor = UIColor.white.cgColor
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        saveButton.backgroundColor = .black
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
