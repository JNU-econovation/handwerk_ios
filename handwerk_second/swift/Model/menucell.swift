//
//  menucell.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 5..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit


class menucell: UICollectionViewCell{
    
    var setting: Setting?{
        didSet{
            namelabel.text = setting?.name
            
            if let imageName = setting?.imageName{
                iconImageView.image = UIImage(named: imageName)
            }
        }
    }
    
    let namelabel: UILabel = {
        let label = UILabel(frame: CGRect(x:100, y: 30, width: UIScreen.main.bounds.width , height: 40))
        label.text = "Setting"
        label.textColor = UIColor.black
        
        return label
    }()
    
    let iconImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "setting.png")
        imageView.contentMode = .scaleAspectFit

        return imageView
        
        
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        self.addSubview(namelabel)
        self.addSubview(iconImageView)
        
       
        addConstraintsWithFormat(format: "H:|-16-[v0(25)]-8-[v1]|", views: iconImageView, namelabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: namelabel)

        addConstraintsWithFormat(format: "V:[v0(25)]", views: iconImageView)
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))

        

    }
    

    
    func setupViews()
    {
        //backgroundColor = UIColor.blue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init failed from menucell.swift")
    }
    
    
}

extension UIView{
    func addConstraintsWithFormat(format: String, views: UIView...){
        
        var viewDictionary = [String: UIView]()
        for(index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewDictionary))
    }
}
