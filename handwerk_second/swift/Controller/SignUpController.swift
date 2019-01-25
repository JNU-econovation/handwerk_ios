//
//  SignUpController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 11..
//  Copyright © 2019년 배성희. All rights reserved.
//
import FirebaseAuth
import UIKit
import Firebase

class SignUpController : UIViewController {
    var defaults = UserDefaults.standard
    var signUpView : SignUpView!
    let db = Firestore.firestore()
    var ref: DocumentReference? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUpView()
    }
    
    
    func setUpView() {
        let signUpView = SignUpView(frame: self.view.frame)
        self.signUpView = signUpView
        self.view.addSubview(signUpView)
        signUpView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)

        self.signUpView.submitAction = submitPressed
        self.signUpView.cancelAction = cancelPressed
        
    }
    
    func cancelPressed() {
        dismiss(animated: true, completion: nil)
    }
 
    func submitPressed() {
        
        guard let email = signUpView.emailTextField.text else {return}
        guard let password = signUpView.pwTextField.text else {return}
        guard let name = signUpView.fullNameTextField.text else {return}
        ref = self.db.collection("handwerk").document("UserInfo").collection("Users").document("\(name)")
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, err) in
            if let err = err {
                print(err.localizedDescription)
            }else {
                guard let uid = authResult?.user.uid else {return}
                self.ref?.setData([
                    "name": name,
                    "password": password,
                    "email": email,
                    "uid" : uid])
                print("Succesfully created a user : ", uid )
                self.defaults.set(false, forKey: "UserIsLoggedIn")
                self.dismiss(animated: true, completion: nil)
            }
        }

        print("submit pressed")
    }
    
}
