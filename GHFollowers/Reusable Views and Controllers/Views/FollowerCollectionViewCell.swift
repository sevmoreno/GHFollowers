//
//  FollowerCollectionViewCell.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/30/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCEll"
    
    let avatar = ReuseAvatarImageView (frame: .zero)
    
    let username = ReuseTitle (textAliment: .center, fontSize: 20)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        congigure ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        
        
        username?.text = follower.login
        
        avatar.downloadImage(from: follower.avatarUrl)
    }
    
    private func congigure () {
        
        addSubview(avatar)
        addSubview(username!)
        
        let padding: CGFloat = 9
       
        NSLayoutConstraint.activate([
            
            avatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            avatar.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            avatar.heightAnchor.constraint(equalTo: avatar.widthAnchor),
            
            username!.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 12),
            username!.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            username!.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            username!.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        
    }
    
}
