//
//  ReuseUserHeaderViewController.swift
//  GHFollowers
//
//  Created by Juan Moreno on 8/14/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseUserHeaderViewController: UIViewController {
    
    
    var user: Users!
    
    
    let avatarImageView = ReuseAvatarImageView(frame: .zero)
    let userNameLabel = ReuseTitle(textAliment: .left, fontSize: 34)
    let nameLabel = ReuseSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = ReuseSecondaryTitleLabel(fontSize: 18)
    let bioLabel = ReuseBodyLabel(textAliment: .left)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubViews()
        viewsLayout()
        configureUIElements ()
      //  avatarImageView.downloadImage(from: user.avatarUrl)
       // userNameLabel?.text = user.
        
        
    }
    

    init(user: Users) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.user = user
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUIElements () {
        
        
        avatarImageView.downloadImage(from: user.avatarUrl)
        userNameLabel?.text = user.login
        nameLabel?.text = user.name ?? ""
        locationLabel?.text = user.location ?? ""
        bioLabel?.text = user.bio ?? ""
        bioLabel?.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        
        locationImageView.tintColor = .secondaryLabel
        
    }
    
    func addSubViews () {
        
        
        view.addSubview(avatarImageView)
        view.addSubview(userNameLabel!)
        view.addSubview(nameLabel!)
        view.addSubview(locationImageView)
        view.addSubview(locationLabel!)
        view.addSubview(bioLabel!)
        
        locationLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
    }
    
    func viewsLayout () {
        
        let padding: CGFloat = 20
        
        let paddingImage: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            userNameLabel!.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            userNameLabel!.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: paddingImage),
            userNameLabel!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -paddingImage),
            userNameLabel!.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel!.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel!.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: paddingImage),
            nameLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel!.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel!.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel!.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel!.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel!.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: paddingImage),
            bioLabel!.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel!.heightAnchor.constraint(equalToConstant: 60)
            

            ])
        
        
    }

}
