//
//  LoginController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 10..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LoginController : UIViewController {
    
    var loginView : LoginView!
    let defaults = UserDefaults.standard
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()

    func setUpView() {
        
        let mainView = LoginView(frame: self.view.frame)
        self.loginView = mainView
        self.loginView.loginAction = loginPressed
        self.loginView.signUpAction = signUpPressed
        self.view.addSubview(loginView)
        loginView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    let signInLabel : UITextView = {
        
        let textView = UITextView(title: "Sign In")
        textView.font = UIFont(name: "Lato-Light", size: 30)
        
        return textView
    }()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpView()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
   
    func loginPressed() {
        
        print("login clicked")
        
        guard let email = loginView.emailTextField.text else {return}
        guard let password = loginView.passwordTextField.text else {return }
        Auth.auth().signIn(withEmail: email, password: password) { (user, err) in
            if let err = err {
                print(err.localizedDescription)
            }else {
                print("User : \(user?.user.uid) signed in")
                self.defaults.set(true, forKey: "UserIsLoggedIn")
                //show main controller
                let mainController = UINavigationController(rootViewController: customTabBar())
                self.present(mainController, animated: true, completion: nil)
            }
        }

    }
    
    func signUpPressed() {
        
        print("sign up clicked")
        let signUpController = SignUpController()
        present(signUpController, animated: true, completion: nil)
    }
    
}
