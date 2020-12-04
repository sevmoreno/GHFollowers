//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Juan Moreno on 8/6/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit
import SafariServices



protocol UserInfoVCDelegate {
    func didTapGitHubProfile (for user: Users)
    
    func didTapGetFollower(for user: Users)
}


class UserInfoViewController: UIViewController {
    
   // let usuarioSeleccionado = Follower ()
    
    
    let headerView = UIView ()
    
    let imageViewOne = UIView ()
    
    let imageViewTwo = UIView ()
    
    
    let dateLabel  = ReuseBodyLabel(textAliment: .center)
    
    
     var userName = String()
    
    
    var delegate: FollowerListVCDelegate!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.backgroundColor = .systemBackground
        
        layoutUI ()
        
        getUserInfo ()
        

        
        
        // Do any additional setup after loading the view.
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
        
        navigationItem.rightBarButtonItem = doneButton
        
        
       // navigationController?.navigationBar.backItem = .cancel
        
    }
    
    
    func getUserInfo () {
        
        NetworkManager.shared.getUsers(for: userName) { (usuario, error) in
            
            
            if let error = error {
               print("error")
                self.presentReuserAlertInMainTreath(title: "Something was wrong", message: error.rawValue, buttonTitle: "Ok")
            }
            
           
            DispatchQueue.main.async {
                
                self.configureUIElementes (usuario!)
                
            
                
            }
           
        }
        
        
        
        
    }
    
    func configureUIElementes (_ usuario: Users) {
        
        self.add(childVC: ReuseUserHeaderViewController(user: usuario), to: self.headerView)
                  
                  // parte del deletae
                  
                  let repoItemVC = ReuseRepoItemVC(user: usuario)
                  
                  repoItemVC.voyADelegara = self
        
        
                 let followerItemVC = ReuseFollowerItemVC(user: usuario)
                    followerItemVC.voyADelegara = self
                  
                  // yo me encanrgo mamy
                  
                  //
                  self.add(childVC: repoItemVC, to: self.imageViewOne)
                  self.add(childVC: followerItemVC, to: self.imageViewTwo)
                  
                  self.dateLabel?.text = usuario.createdAt.convertToDisplayFormat()
                  
        
        
        
        
    }
    
    func layoutUI () {
        
        
       
        
        view.addSubview(headerView)
        view.addSubview(imageViewOne)
        view.addSubview(imageViewTwo)
        view.addSubview(dateLabel!)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        imageViewTwo.translatesAutoresizingMaskIntoConstraints = false
        imageViewOne.translatesAutoresizingMaskIntoConstraints = false
        dateLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        
       //  headerView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//         imageViewOne.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//        imageViewTwo.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            
            imageViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            imageViewOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageViewOne.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageViewOne.heightAnchor.constraint(equalToConstant: 140),
            
            imageViewTwo.topAnchor.constraint(equalTo: imageViewOne.bottomAnchor, constant: 20),
            imageViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imageViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageViewTwo.heightAnchor.constraint(equalToConstant: 140),
            
            
            
            dateLabel!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            dateLabel!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
            
            
        
        
        ])
        
    }
    
    func add(childVC: UIViewController, to containerView: UIView) {
        
        addChild(childVC)
        
        containerView.addSubview(childVC.view)
        
        childVC.view.frame = containerView.bounds
        
        childVC.didMove(toParent: self)
        
    }

    @objc func dismissVC () {
        
        self.dismiss(animated: true, completion: nil)
    }
 

}


extension UserInfoViewController: UserInfoVCDelegate {
    
    
    func didTapGitHubProfile(for user: Users) {
        
        
        guard let url = URL(string: user.htmlUrl!) else {
            
            presentReuserAlertInMainTreath(title: "Invalid URL", message: "", buttonTitle: "OK")
            return
        }
        
       presentSafariVC(url)
        
    }
    
    func didTapGetFollower(for user: Users) {
        
        if  user.followers != 0 { return }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
       
    }
    
    
    
    
    
    
    
    
    
}
