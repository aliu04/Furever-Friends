//
//  EditViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-30.
//

import UIKit

class EditViewController: UIViewController {
    
    var editProfile = UILabel()
    var picImageView = UIImageView()
    var dogName = UILabel()
    var nameInput = UITextField()
    var dogAge = UILabel()
    var ageInput = UITextField()
    var dogBio = UILabel()
    var bioInput = UITextField()
    var submitButton = UIButton()

    //TODO: Add weak delegate and initializer
    var dog: Dog
    weak var delegate: EditDelegate?

    init(dog: Dog, delegate: EditDelegate) {
        self.dog = dog
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        editProfile.text = "Edit Profile"
        editProfile.font = .boldSystemFont(ofSize: 18)
        editProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfile)
        
        picImageView.image = UIImage(named:"dog")
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        dogName.text = "Name: "
        dogName.font = .boldSystemFont(ofSize: 20)
        dogName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogName)
        
        nameInput.text = dog.name
        nameInput.font = .systemFont(ofSize: 20)
        nameInput.backgroundColor = .systemGray3
        nameInput.layer.cornerRadius = 5
        nameInput.clipsToBounds = true
        nameInput.textAlignment = .left
        nameInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameInput)
        
        dogAge.text = "Age: "
        dogAge.font = .boldSystemFont(ofSize: 20)
        dogAge.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogAge)
        
        ageInput.text = String(dog.age)
        ageInput.font = .systemFont(ofSize: 20)
        ageInput.backgroundColor = .systemGray3
        ageInput.layer.cornerRadius = 5
        ageInput.clipsToBounds = true
        ageInput.textAlignment = .left
        ageInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ageInput)
        
        dogBio.text = "Bio: "
        dogBio.font = .boldSystemFont(ofSize: 20)
        dogBio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(dogBio)
        
        bioInput.text = dog.bio
        bioInput.font = .systemFont(ofSize: 20)
        bioInput.backgroundColor = .systemGray3
        bioInput.layer.cornerRadius = 5
        bioInput.clipsToBounds = true
        bioInput.textAlignment = .left
        bioInput.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioInput)

        submitButton.setTitle("Save", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        setupConstraints()
    }

    @objc func saveChanges() {
        delegate?.saveName(name: nameInput.text ?? "")
        dog.name = nameInput.text!
        delegate?.saveAge(ageLabel: ageInput.text ?? "")
        delegate?.saveBio(bio: bioInput.text ?? "")
        dog.bio = bioInput.text!
        dismiss(animated: true)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            editProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            picImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picImageView.topAnchor.constraint(equalTo: editProfile.bottomAnchor, constant: 20),
            picImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            picImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            dogName.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 20),
            dogName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            nameInput.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 20),
            nameInput.leadingAnchor.constraint(equalTo: dogName.trailingAnchor, constant: 10),
            nameInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])
        
        NSLayoutConstraint.activate([
            dogAge.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 10),
            dogAge.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            ageInput.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 10),
            ageInput.leadingAnchor.constraint(equalTo: dogAge.trailingAnchor, constant: 10),
            ageInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])
        
        NSLayoutConstraint.activate([
            dogBio.topAnchor.constraint(equalTo: dogAge.bottomAnchor, constant: 10),
            dogBio.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            bioInput.topAnchor.constraint(equalTo: ageInput.bottomAnchor, constant: 10),
            bioInput.leadingAnchor.constraint(equalTo: dogBio.trailingAnchor, constant: 10),
            bioInput.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])

        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
//    @objc func saveChanges() {
//            dismiss(animated: true)
//        }
//
}
protocol EditDelegate: UIViewController {
    func saveName(name: String)
    func saveAge(ageLabel: String)
    func saveBio(bio: String)

}
