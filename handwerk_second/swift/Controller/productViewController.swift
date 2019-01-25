//
//  productViewController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 9..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class productViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    fileprivate let searchBarheight : Int = 40
    var products : [Product] = productData
    var filtered : [Product] = []
    var isSearching : Bool = false
    
    let albumsCellId = "albumsCellId"
    
    let searchBar : UISearchBar = {
        let sb = UISearchBar()
        return sb
        
    }()
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 50
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        return cv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isNavigationBarHidden = true

        setUpViews()
        
    }
    
    func setUpViews()
    {
        //collectionview
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)

        collectionView.register(productViewCell.self, forCellWithReuseIdentifier: albumsCellId)
        collectionView.backgroundColor = .white
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)

        //searchbar
        collectionView.addSubview(searchBar)
        searchBar.frame = CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: searchBarheight)
        searchBar.returnKeyType = UIReturnKeyType.done
        self.searchBar.delegate = self
        
    }

    
    //- overrided collectionviews -//
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return (CGSize(width: view.bounds.width, height: CGFloat(searchBarheight)))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filtered.count
        }
        return products.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: albumsCellId, for: indexPath)as! productViewCell
        
        cell.autolayoutCell()


        if isSearching {
            cell.product = filtered[indexPath.row]
        }else {
            cell.product = products[indexPath.row]

        }

        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let height = (UIScreen.main.bounds.size.width - 3 * CGFloat(10))/2
        let height = (UIScreen.main.bounds.size.width - 2 * CGFloat(10))/2

        return CGSize(width: (view.frame.width/2)-20, height: height)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
    }
}
