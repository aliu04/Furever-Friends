//
//  EditViewController.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-30.
//

import UIKit

class EditViewController: UIViewController {
    
    let editProfile = UILabel()
    let picImageView = UIImageView()
    let songLabel = UILabel()
    let songTitleField = UITextField()
    let artistLabel = UILabel()
    let artistField = UITextField()
    let albumLabel = UILabel()
    let albumField = UITextField()
    let submitButton = UIButton()

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
        
        picImageView.image = UIImage(named:"Melodrama")
        picImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picImageView)
        
        songLabel.text = "Song: "
        songLabel.font = .boldSystemFont(ofSize: 20)
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(songLabel)
        
        songTitleField.text = dog.name
        songTitleField.font = .systemFont(ofSize: 20)
        songTitleField.backgroundColor = .systemGray3
        songTitleField.layer.cornerRadius = 5
        songTitleField.clipsToBounds = true
        songTitleField.textAlignment = .left
        songTitleField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(songTitleField)
        
        artistLabel.text = "Artist: "
        artistLabel.font = .boldSystemFont(ofSize: 20)
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistLabel)
        
        artistField.text = String(dog.age)
        artistField.font = .systemFont(ofSize: 20)
        artistField.backgroundColor = .systemGray3
        artistField.layer.cornerRadius = 5
        artistField.clipsToBounds = true
        artistField.textAlignment = .left
        artistField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(artistField)
        
        albumLabel.text = "Album: "
        albumLabel.font = .boldSystemFont(ofSize: 20)
        albumLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumLabel)
        
        albumField.text = dog.bio
        albumField.font = .systemFont(ofSize: 20)
        albumField.backgroundColor = .systemGray3
        albumField.layer.cornerRadius = 5
        albumField.clipsToBounds = true
        albumField.textAlignment = .left
        albumField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumField)

        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.systemBlue, for: .normal)
        submitButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        setupConstraints()
    }

//    @objc func changeContactCell() {
//        //TODO: call delegate functions and dismiss view
//        delegate?.changeSongName(song: songTitleField.text ?? "sorry")
//        dog.dogName = songTitleField.text!
//        delegate?.changeArtist(artistName: artistField.text ?? "sorry")
//        dog.dogAge = Int(artistField.text!) ?? 0
//        delegate?.changeAlbum(albumName: albumField.text ?? "sorry")
//        dog.dogDescription = albumField.text!
//        dismiss(animated: true)
//    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            editSong.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editSong.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            picImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picImageView.topAnchor.constraint(equalTo: editSong.bottomAnchor, constant: 20),
            picImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            picImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 20),
            songLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            songTitleField.topAnchor.constraint(equalTo: picImageView.bottomAnchor, constant: 20),
            songTitleField.leadingAnchor.constraint(equalTo: songLabel.trailingAnchor, constant: 10),
            songTitleField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 10),
            artistLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            artistField.topAnchor.constraint(equalTo: songTitleField.bottomAnchor, constant: 10),
            artistField.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor, constant: 10),
            artistField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])
        
        NSLayoutConstraint.activate([
            albumLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 10),
            albumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            albumField.topAnchor.constraint(equalTo: artistField.bottomAnchor, constant: 10),
            albumField.leadingAnchor.constraint(equalTo: albumLabel.trailingAnchor, constant: 10),
            albumField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33),
        ])

        NSLayoutConstraint.activate([
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func saveChanges() {
            dismiss(animated: true)
        }
    
}

//TODO: Add protocol to change contact
protocol EditDelegate: UIViewController {
    func save()

}
