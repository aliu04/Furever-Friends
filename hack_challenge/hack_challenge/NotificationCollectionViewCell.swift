//
//  NotificationCollectionViewCell.swift
//  hack_challenge
//
//  Created by Helen Lei on 11/30/22.
//

import UIKit
import SnapKit

class NotificationCollectionViewCell: UICollectionViewCell {
    var notif = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        notif.textColor = .black
        notif.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(notif)
        
        notif.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp_topMargin).offset(15)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
    func configureNotifs(match: Dog) {
        notif.text = "You matched with " + match.dogName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
