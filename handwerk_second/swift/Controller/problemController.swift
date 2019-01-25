//
//  problemController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 10..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class problemController : UIViewController{
    
    var p_view : problemView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupMenuBar()
    }
    
    let menuBar : MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar () {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
    
    func setUpView(){
        self.tabBarController?.navigationController?.isNavigationBarHidden = true

        let mainView = problemView(frame: self.view.frame)
        self.p_view = mainView
        self.view.addSubview(p_view)
        p_view.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        navigationItem.title = "Solution Videos"
        navigationController?.navigationBar.isTranslucent = false
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height)
        navigationItem.titleView = titleLabel
        
    }
    
    
    let titleLabel : UILabel = {
        let tl = UILabel()
        tl.text = "Solution Video"
        tl.font = UIFont.init(name: "Lato-Bold", size: 20)
        return tl
    }()
    
   
}
