//
//  mainView+handticeView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 17..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class mainViewSubView : NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let cellHeight = 30

    override init() {
        super.init()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    
    let handtice : UITextView = {
        let handtice = UITextView(title: "Hand-tice")
        handtice.font = UIFont(name: "Lato-Light", size: 20)
        return handtice
    }()
    
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.init(r: 52, g: 63, b: 75)
        return cv
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! menucell
        
        let setting = settings[indexPath.item]
        //cell.setting = setting
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //아이템 클릭시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("main notice clicked")
        /*
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }
        }) { (completed: Bool) in
            
            let setting = self.settings[indexPath.item]
            self.homeController?.showControllerForSettings(setting: setting)
        }
         */
        
    }
    
    //공지사항 목록 갯수
    let settings: [String] = {
        let first = "진안 자연바위"
        let second = "Hang And Never Drop"
        
        return [first, second]
    }()
    
}
