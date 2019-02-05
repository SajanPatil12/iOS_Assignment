//
//  CountryTableViewCell.swift
//  TestiOS
//
//  Copyright © 2019 Sajan. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    let cellImageView = UIImageView()
    let titleLabel = UILabel()
    let detailLabel = UILabel()

    // MARK:- Initalizers
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let marginGuide = contentView.layoutMarginsGuide
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = true
        cellImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        cellImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        cellImageView.frame = CGRect(x: 5.0, y: 5.0, width: 60.0, height: 60.0)
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
        // configure titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor,constant:5.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor,constant:5.0).isActive = true
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        
        // configure detailLabel
        contentView.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor,constant:5.0).isActive = true
        detailLabel.bottomAnchor.constraint(greaterThanOrEqualTo: cellImageView.bottomAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor,constant:5.0).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "Avenir-Book", size: 12)
        detailLabel.textColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
