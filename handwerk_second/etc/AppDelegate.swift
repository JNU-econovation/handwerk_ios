//
//  AppDelegate.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 1..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let defaults = UserDefaults.standard
    var userIsLoggedIn: Bool?

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = UINavigationController(rootViewController: MainViewController()) //---2
        window?.makeKeyAndVisible() //---3
        
        //get rid of black bar underneath navbar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for : .default)
        
        let loginController = UINavigationController(rootViewController: LoginController())
        let mainController = UINavigationController(rootViewController: customTabBar())
        userIsLoggedIn = defaults.bool(forKey: "UserIsLoggedIn")
        
        if userIsLoggedIn == true {
            window?.rootViewController = mainController
        } else {
            window?.rootViewController = loginController
        }
        
        
        
        return true
    }
  
    
}
