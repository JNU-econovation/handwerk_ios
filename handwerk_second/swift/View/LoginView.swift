//
//  loginView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 10..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit


class LoginView : UIView {
    
    var loginAction : (()-> Void)?
    var signUpAction: (()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    func setUp(){
        
        backgroundColor = .black
        let stackView = createStackView(
            views: [createStackView(views: [logoImg, signInLabel], space: 10), createStackView(views: [emailTextField, passwordTextField, loginButton, signUpButton], space: 15)],
            space: 35)
        addSubview(stackView)
        
        stackView.setAnchor(width: self.frame.width - 60, height: 0)
       
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
    }
    
    
    let logoImg : UIImageView = {
        
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo")
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField(placeHolder: "Email")
        return tf
    }()
    
    let passwordTextField: UITextField = {        
        let tf = UITextField(placeHolder: "Password")
        return tf
    }()
    
    let loginButton: UIButton = {
        
        let button = UIButton(title: "Login")
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)

        return button
    }()
    
    let signUpButton: UIButton = {
        
        let button = UIButton(title: "Sign Up")
        
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    let signInLabel : UITextView = {
        
        let textView = UITextView(title: "Sign In")
        textView.font = UIFont(name: "Lato-Light", size: 30)

        return textView
    }()

    
    @objc func handleSignup(){
        signUpAction?()
    }
    @objc func handleLogin(){
        loginAction?()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
        
    }
    
}
