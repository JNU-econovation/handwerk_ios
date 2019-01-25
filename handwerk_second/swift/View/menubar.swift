//
//  menubar.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 23..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class MenuBar : UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
   
    let wallName = ["A-1", "A-2", "B-1", "B-2"]
    let cellId = "cellId"
    var homeController : HomeController?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.label.text = wallName[indexPath.item]

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/4, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self

        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        setUp()
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
        
        setupHorizontalBar()
        
    }
    
    var horizontalBarLeftAnchorCosntraint : NSLayoutConstraint?
    
    func setupHorizontalBar(){
        
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.red
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorCosntraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        
        horizontalBarLeftAnchorCosntraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/12).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeController?.scrollToMenuIndex(menuIndex: indexPath.item)
        
    }
    
    
    func setUp() {
        
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        collectionView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor
            ).isActive = true
    }
    
  
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}


class MenuCell : BaseCell {
    
    let label : UILabel = {
        let lb = UILabel()
        lb.text = "A"
        lb.font = UIFont(name: "Lato-Light", size: 15)
        lb.textAlignment = .center
        return lb
    }()
    
    override var isHighlighted: Bool{
        didSet {
            label.tintColor = isHighlighted ? UIColor.blue : UIColor.red
        }
        
    }
    
    override var isSelected: Bool{
        didSet {
            label.tintColor = isHighlighted ? UIColor.white : UIColor.red
        }
        
    }
    override func setUpViews() {
        super.setUpViews()
        addSubview(label)
        addConstraintsWithFormat(format: "H:[v0(28)]", views: label)
        addConstraintsWithFormat(format: "V:[v0(28)]", views: label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
}

