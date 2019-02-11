//
//  ProductDetailView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 2. 2..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit
import Firebase


class url : NSObject {
    var urlString : String?
}

class CustomCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setUpView()
    }
    
    func setUpView(){
        addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.setAnchor(width: frame.width, height: frame.height)
    }
    
    let imageView : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        
        return imgView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension UIImageView {
    
    func LoadDataWithURL (urlString : String) {
        let url = URL(string: urlString)
        
        self.contentMode = .scaleAspectFit
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
    }
}

extension detailView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(urlclass?.count)
        return urlclass?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        let str = urlclass?[indexPath.row]
        cell.imageView.LoadDataWithURL(urlString: str?.urlString ?? "https://firebasestorage.googleapis.com/v0/b/handwerk-393cd.appspot.com/o/Product%2Fnoimage.png?alt=media&token=4b932953-0c54-4902-ae5a-ccbead2c9004")
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
    
}


class detailView : UIView {
    let cellId = "cellId"
    var urlclass : [url]?
    
    let navBar : UINavigationBar = {
        let nb = UINavigationBar()
        return nb
        
    }()
    
    
    let upperView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    let productName : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 30)
        label.sizeToFit()

        return label
    }()
    
    let brandName : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Light", size: 25)
        label.sizeToFit()
        return label
    }()
    
    
    let priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 30)
        label.sizeToFit()

        label.text = "18,000"
        return label
    }()
    
    let detailLabel : UILabel = {
        
        let label = UILabel()
        label.font = UIFont(name: "Lato-Regular", size: 20)
        label.sizeToFit()
        
        label.text = "이곳에 상품의 설명이 들어갑니다."
        return label
        
    }()
    
    
    let productImageCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isUserInteractionEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        
        return collectionView
    }()
    
    func setUpCollView() {
        
        productImageCollectionView.delegate = self
        productImageCollectionView.dataSource = self
        productImageCollectionView.register(CustomCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func setUpNavBar () {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        button.setAnchor(width: 60, height: 60)
        button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 30, bottom: 0, right: 0)
        
        let navItem = UINavigationItem()
        navItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        navBar.setItems([navItem], animated: false)
        
    }
    
    @objc func backBtnClicked() {
        print("clck")

        
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        
        setUpCollView()
        setUpNavBar()
        addSubview(navBar)
        addSubview(upperView)
        addSubview(productName)
        addSubview(brandName)
        addSubview(productImageCollectionView)
        addSubview(priceLabel)
        addSubview(detailLabel)
       
        navBar.setAnchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 44)
        navBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        navBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        upperView.setAnchor(top: navBar.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: frame.width, height: 50)
        productName.setAnchor(top: upperView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0)
        brandName.setAnchor(top: productName.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0)
        productImageCollectionView.setAnchor(top: brandName.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 500)
        priceLabel.setAnchor(top: productImageCollectionView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 50)
        detailLabel.setAnchor(top: priceLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 100)
        
    }
    
    func setImageUrlArr(productName : String) {
        
        let db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        urlclass = [url]()
        
        db.collection("handwerk").document("Product").collection(productName).getDocuments() {
            (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in (querySnapshot?.documents)!{
                    
                    //url 저장
                    let str = document.data()["url"] as! String
                    let urlClass = url()
                    urlClass.urlString = str
                    self.urlclass?.append(urlClass)
                    
                }
                
                print("save url complete")
                self.productImageCollectionView.reloadData()

            }
            
        }
        
        
    }

}

class ProductDetailView : NSObject {
    
    func productDetailView(selected : [Product]) {
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView()
            view.frame = CGRect(x: keyWindow.frame.width - 10, y: keyWindow.frame.height - 10, width: 50, height: 50 )
            view.backgroundColor = .white
            keyWindow.addSubview(view)
            
            let detailFrameHeight = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.height)
            let detail = detailView(frame: detailFrameHeight)
            
            //label setting
            detail.brandName.text = selected[0].brandName
            detail.productName.text = selected[0].productName
            
            //image setting
            let imgName = selected[0].imageName
            detail.setImageUrlArr(productName: imgName!)
            
         
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                view.frame = detail.frame
                
            }, completion: { (completedanimation) in
         //do something here in later
                
            })
         
            
        }
            
       
         }

}


