//
//  SignUpView.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 11..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class SignUpView : UIView {
    let toolBar = UIToolbar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    var submitAction : (()->Void)?
    var cancelAction : (()->Void)?
    
    @objc func handleSubmit() {
        submitAction?()
    }
    
    @objc func handleCancel() {
        cancelAction?()
    }
    
    func setUp(){
        
        backgroundColor = .black
        let stackView = createStackView(views: [logoImg, signUpLabel ,fullNameTextField, phoneTextField, pwTextField, BirthdayTextField, emailTextField, signUpBtn, cancelbtn], space: 15)
        addSubview(stackView)
        stackView.setAnchor(width: self.frame.width - 60, height: 0)
        
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        BirthdayTextField.inputView = birthdayPicker
        
    }
    
    let logoImg : UIImageView = {
        
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logo")
        imgView.setAnchor(width: 70, height: 70)
        
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        return imgView
    }()
    
    let signUpLabel : UITextView = {
        
        let textView = UITextView(title: "Sign Up")
        textView.font = UIFont(name: "Lato-Light", size: 30)
        return textView
    }()
    
    let fullNameTextField : UITextField = {
        let tf = UITextField(placeHolder: "Full name")
        return tf
    }()
    
    let phoneTextField : UITextField = {
        let tf = UITextField(placeHolder: "Phone")
        return tf
    }()
    
    let pwTextField : UITextField = {
        let tf = UITextField(placeHolder: "Password")
        return tf
    }()
    
    let birthdayPicker : UIDatePicker = {
        
        let dp = UIDatePicker()
        dp.datePickerMode = .date
        
        dp.timeZone = NSTimeZone.local
        dp.backgroundColor = UIColor.white
        dp.setAnchor(width: 0, height: 150)
        dp.addTarget(self, action: #selector(datePickerValueChanged(sender: )), for: .valueChanged)
        
        return dp
    }()
    
    
    let BirthdayTextField : UITextField = {
        let tf = UITextField(placeHolder: "Birthday")
        tf.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: .touchUpInside)
        return tf
    }()
    
    let emailTextField : UITextField = {
        let tf = UITextField(placeHolder: "Email")
        return tf
    }()
    
    let signUpBtn : UIButton = {
        let btn = UIButton(title: "Create Your Account")
        btn.addTarget(self, action: #selector(handleSubmit), for: .touchUpInside)

        return btn
    }()
    
    let cancelbtn : UIButton = {
        let btn = UIButton(title: "Cancel")
        btn.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return btn
    }()
    
    
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        BirthdayTextField.text = formatter.string(from: sender.date)
    }
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        
        birthdayPicker.isHidden = true
        toolBar.isHidden = true
        
        
    }
    
    @objc func cancelClick() {
        birthdayPicker.isHidden = true
        toolBar.isHidden = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
