//
//  customTabBar.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 8..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class customTabBar : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let productController = productViewController()
        let firstnavigationController = UINavigationController(rootViewController: productController)
        firstnavigationController.title = "Product"
        firstnavigationController.tabBarItem.image = UIImage(named: "product")
        
        let mainViewController = MainViewController_()
        let secondNavigationController = UINavigationController(rootViewController: mainViewController)
        secondNavigationController.title = "Main"
        secondNavigationController.tabBarItem.image = UIImage(named: "product")
    
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let problemcontroller = HomeController(collectionViewLayout: layout)
        let thirdNavigationController = UINavigationController(rootViewController: problemcontroller)
        thirdNavigationController.title = "Problem"
        thirdNavigationController.tabBarItem.image = UIImage(named: "product")
 
        
        viewControllers = [firstnavigationController, secondNavigationController, thirdNavigationController]
 
       
    }
    
    
}
