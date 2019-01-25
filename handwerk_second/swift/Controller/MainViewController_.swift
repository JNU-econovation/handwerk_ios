//
//  MainViewController_.swift
//  handwerk_second
//
//  Created by 배성희 on 2019. 1. 17..
//  Copyright © 2019년 배성희. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class MainViewController_: UIViewController , UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource
{
    var imageArray:[UIImage] = [#imageLiteral(resourceName: "background"), #imageLiteral(resourceName: "background1"), #imageLiteral(resourceName: "splashImage")]
    var homeController : MainViewController_?
    let defaults = UserDefaults.standard
    let db = Firestore.firestore()
    let tableView = UITableView()

    var noticeArr = [Notice]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
       
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings

        //hide upper bar
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isNavigationBarHidden = true

        //view
        labelSetting()
        setUpCarousel()
        setupCollectionView()
        setupAllViews()
        setBottomNotice()

        //db , auth
        fetchUserInfo()
        
    }
    
    let carousel : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let blackView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.45
        view.backgroundColor = UIColor.init(r: 52, g: 63, b: 75)
        return view
    }()
    
    
    //버튼 눌렀을 시 동작하게
    let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(handlemore), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "menuicon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    var collectionView : UICollectionView!
    var current: Int!
    var i = Int()

    var timer: Timer!

    func setBottomNotice() {
        let viewHeight = CGFloat(130)
        
        //notice
        //table view
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "contactCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //handtice label
        let handticeLabel = UILabel()
        handticeLabel.backgroundColor = UIColor.clear
        handticeLabel.text = "Hand-tice"
        handticeLabel.translatesAutoresizingMaskIntoConstraints = false
        handticeLabel.font = UIFont(name: "Lato-Regular", size: 60)
        handticeLabel.textColor = UIColor.white
        handticeLabel.textAlignment = .center
        
        
        let separator = UIView()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [handticeLabel, separator, tableView])
        view.addSubview(stackView)
        stackView.axis = .horizontal
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -viewHeight),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            ])
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing

        tableView.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.65).isActive = true
        tableView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1).isActive = true
        separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separator.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.35).isActive = true
        handticeLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 0.2).isActive = true
        handticeLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1).isActive = true

        
        let bg = UIView(frame: stackView.bounds)
        bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bg.backgroundColor = UIColor.init(r: 52, g: 63, b: 75)
        stackView.addSubview(bg)
        stackView.insertSubview(bg, belowSubview: stackView.arrangedSubviews[0])
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        

        
        
        
    }
    
    func labelSetting() {
        
        //공지사항 글 불러오기
        let noticeRef = db.collection("handwerk").document("Board").collection("Notice")
        noticeRef.order(by: "date", descending: true).limit(to: 3).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                    self.noticeArr = querySnapshot!.documents.compactMap({Notice(dictionary: $0.data())})
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
            
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let notice = noticeArr[indexPath.row]
        
        cell.textLabel?.text = "\(notice.title)"
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
    
    @objc func handlemore(){
        settingMenubar.show()
    }
    
    lazy var settingMenubar: SettingMenubar = {
        let launcher = SettingMenubar()
        launcher.homeController = self
        return launcher
    }()
    
    func setUpCarousel() {
        
        view.addSubview(carousel)
        carousel.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    }
    
    func setupAllViews() {
        
        carousel.addSubview(collectionView)
        carousel.addSubview(blackView)
        collectionView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        blackView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        view.addSubview(button)
        
        button.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat((tabBarController?.tabBar.frame.height)!)).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30.0).isActive = true
    }

    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isUserInteractionEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .cyan
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
      
        cell.backgroundView = UIImageView(image: imageArray[indexPath.item])
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollCollectionView), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    
    @objc func scrollCollectionView () {
        
        if let coll = collectionView {
            for cell in coll.visibleCells {
                let indexPath : IndexPath? = coll.indexPath(for: cell)
                let arrayCount = imageArray.count - 1
                
                if ((indexPath?.row)! < arrayCount){
                    let indexPath1 : IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)!+1 , section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                    current = indexPath!.row
                    
                } else {
                    let indexPath1 : IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                    current = indexPath1!.row
                    
                }
            }
        }
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
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
    
    //////db line//////
    
    //value set for user
    var appUser : AppUser? {
        didSet {
            guard let username = appUser?.name else {return}
            guard let usermail = appUser?.email else {return}
            guard let userid = appUser?.uid else {return}
            navigationItem.title = username
            
        }
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
