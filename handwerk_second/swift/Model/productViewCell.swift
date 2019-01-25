//
//  productViewCell.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 22..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class productViewCell : UICollectionViewCell {
    
    var stackView : UIStackView = UIStackView()
    var imageView : UIImageView = UIImageView()
    var brandLabel : UILabel = UILabel()
    var nameLabel : UILabel = UILabel()
    
    var labelStackView : UIStackView = UIStackView()
    
    func autolayoutCell() {
        
        self.backgroundColor = .white
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false

        //brand label
        labelStackView.addArrangedSubview(brandLabel)
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.text = "brand"
        brandLabel.textAlignment = .center
        brandLabel.textColor = UIColor.black
        brandLabel.font = UIFont(name: "Lato-Bold", size: 15)
        
        //autolayut label
        labelStackView.addArrangedSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "product name"
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont(name: "Lato-Thin", size: 15)

        //label stack view setting
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.distribution = .equalCentering
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //autolayout imageView
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.3/3.0).isActive = true
        imageView.image = UIImage(named: "smellwell")
        imageView.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(labelStackView)
        
        //stackview setting
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        
    }
    
    var product : Product! {
        
        didSet{
            imageView.image = UIImage(named: product.imageName!)
            nameLabel.text = product.productName ?? ""
            brandLabel.text = product.brandName ?? ""
        }
        
    }
}
