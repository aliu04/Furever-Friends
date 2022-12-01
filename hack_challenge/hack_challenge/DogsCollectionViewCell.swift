//
//  DogsCollectionViewCell.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit
import SnapKit

class DogsCollectionViewCell: UICollectionViewCell {

    var dogsImageView = UIImageView()
    var dogName = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true

        dogsImageView.contentMode = .scaleAspectFit
        dogsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        dogName.textColor = .black
        dogName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dogName)

        contentView.addSubview(dogsImageView)
        
        dogName.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp_topMargin).offset(15)
            make.centerX.equalTo(contentView.snp.centerX)
        }
        
        dogsImageView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.top.equalTo(dogName.snp_topMargin).offset(15)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
//
//    func setupConstraints() {
//
//        NSLayoutConstraint.activate([
//            dogsImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            dogsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            dogsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            dogsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            dogsImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
//            dogsImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            dogName.topAnchor.constraint(equalTo: dogsImageView.bottomAnchor, constant: 10),
//            dogName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//        ])
//    }

    func configure(dog: Dog) {
        dogsImageView.image = UIImage(named: dog.dogImage)
        dogName.text = dog.dogName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


