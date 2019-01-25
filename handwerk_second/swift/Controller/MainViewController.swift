//
//  MainViewController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 4..
//  Copyright © 2019년 배성희. All rights reserved.
//

import Firebase
import UIKit
import FirebaseAuth

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    
    let defaults = UserDefaults.standard
    let db = Firestore.firestore()

    //value set for user
    var appUser : AppUser? {
        didSet {
            guard let username = appUser?.name else {return}
            guard let usermail = appUser?.email else {return}
            guard let userid = appUser?.uid else {return}
            navigationItem.title = username

        }
    }
    
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var slides:[UIImageView] = []
    var imageArray = [UIImage]()
    
    var timer : Timer!
    var i = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings
        
        //hide navigationbar
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isNavigationBarHidden = true

        //add button

        view.addSubview(button)
        button.frame = CGRect(x: view.frame.width - 100, y: (navigationController?.navigationBar.frame.height)! + 50 , width: 100, height: 50)
        
        //views
        slides = createSlides()
        setupSlideScrollView()

        //db , auth
        fetchUserInfo()

      
        
    }

    
    
    let blackView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()
    
    
    lazy var settingMenubar: SettingMenubar = {
        let launcher = SettingMenubar()
        //launcher.homeController = self
        return launcher
    }()
    
    @objc func handlemore(){
        
        settingMenubar.show()
        
    }
    
    func showControllerForSettings(setting: Setting){
        
        if setting.name == "Sign Up"{
            let signUpController = LoginController()
            navigationController?.pushViewController(signUpController, animated: true)
            
        }else if setting.name == "Log out"{
            logout()
        }else {
            let dummySettingViewController = UIViewController()
            dummySettingViewController.view.backgroundColor = UIColor.white
            dummySettingViewController.navigationItem.title = setting.name
            navigationController?.navigationBar.tintColor = UIColor.white
            navigationController?.pushViewController(dummySettingViewController, animated: true)
        }
        
    }
   
    func setupSlideScrollView() {
        
        view.addSubview(scrollView)
        imageArray = [#imageLiteral(resourceName: "background2"), #imageLiteral(resourceName: "background1"), #imageLiteral(resourceName: "splashImage")]

        scrollView.backgroundColor = UIColor.black
        scrollView.frame = view.frame
        scrollView.isPagingEnabled = true
        scrollView.isScrollEnabled = false
        scrollView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        

        for i in 0 ..< imageArray.count {
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.scrollView.frame.width, height: self.scrollView.frame.height)
            imageView.contentMode = .scaleToFill

            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)

            scrollView.addSubview(imageView)

            
        }
        
       
        let scrollingTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.newStartScrolling), userInfo: nil, repeats: true)
        scrollingTimer.fire()
        
    }
    
    
    //버튼 눌렀을 시 동작하게
    let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(handlemore), for: .touchUpInside)
        
        return button
    }()
    
    
    
    @objc func newStartScrolling(){
        
        //self아니고 다른걸로 할 수 있나? -> self는 delegate 연결 할 때에만 쓴다
        if i == slides.count{
            i = 0
        }
        
        let x = CGFloat(i) * view.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        i += 1
        
    }
    
    func createSlides()->[UIImageView]
    {
        let slide1 = UIImageView()
        slide1.image = UIImage(named: "background1")
        
        let slide2 = UIImageView()
        slide2.image = UIImage(named: "background2")
        
        let slide3 = UIImageView()
        slide3.image = UIImage(named: "wall.jpeg")
        
        return [slide1, slide2, slide3];
    }
    
    //log out func
    @objc func logout () {
        print("log out")
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            defaults.set(false, forKey: "UserIsLoggedIn")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        let login = UINavigationController(rootViewController: LoginController())
        present(login, animated: true, completion: nil)
    }
    
    func fetchUserInfo() {
        
        print("fetchUserInfo In")
        
        guard let userId = Auth.auth().currentUser?.uid else {return}
        
        
        db.collection("handwerk").document("UserInfo").collection("Users").whereField("uid", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in (querySnapshot?.documents)!{
                        guard let username = document.data()["name"] as? String else {return}
                        guard let usermail = document.data()["email"] as? String else {return}
                        guard let userId = document.data()["uid"] as? String else {return}
                        self.appUser = AppUser(name: username, email: usermail, uid: userId)
                    }

                }
            }
        }
        
    }

