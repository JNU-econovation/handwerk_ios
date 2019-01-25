//
//  ViewController.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 1..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    //side menu btn
    @IBAction func sidemenuBtn(_ sender: Any) {
        
        let blackmenu = UIView()
        blackmenu.backgroundColor = UIColor.black
        view.addSubview(blackmenu)
       
        
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.delegate = self
        }
    }
    var timer : Timer!
    var i = Int()
    
    //이거 슬라이드 여러장 할려고 하는거구나
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = createSlides()
        setupSlideScrollView(slides:slides)
        
    
    }
    
    //~ 슬라이드 쇼 코드 ~//
    func createSlides()->[Slide]{
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "max.png")
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "eva.jpeg")

        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imageView.image = UIImage(named: "wall.jpeg")

        return [slide1, slide2, slide3];
        
    }
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
        let scrollingTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.newStartScrolling), userInfo: nil, repeats: true)
        scrollingTimer.fire()
    }
    
    @objc func newStartScrolling(){
        
        //self아니고 다른걸로 할 수 있나? -> self는 delegate 연결 할 때에만 쓴다
        if i == slides.count{
            self.i = 0
        }
        
        let x = CGFloat(self.i) * view.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
        self.i += 1
        
    }
    

   
}

