//
//  FilterCollectionViewCell.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import UIKit
import SnapKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterLabel = UILabel()
    let filterBg = UIColor(red: 0.98, green: 0.929, blue: 0.804, alpha: 1.0)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        

        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(filterLabel)
        
        filterLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    func configure(filter: UILabel) {
        filterLabel.text = filter.text
        filterLabel.textColor = filter.textColor
        filterLabel.backgroundColor = filter.backgroundColor
        contentView.backgroundColor = filter.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
