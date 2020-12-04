//
//  ReuseItemInfoView.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/4/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos,gists,followers,following
    
}

class ReuseItemInfoView: UIView {

 
    
    let symbolImageView = UIImageView ()
    
    let titleLabel = ReuseTitle(textAliment: .left, fontSize: 14)
    
     let countLabel = ReuseTitle(textAliment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(symbolImageView)
        addSubview(titleLabel!)
        addSubview(countLabel!)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
        
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel!.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel!.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel!.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel!.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel!.heightAnchor.constraint(equalToConstant: 18)
            
        
        ])
         
        
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
    
    switch itemInfoType {
    case .repos:
        
        symbolImageView.image = UIImage(systemName: "folder")
        titleLabel?.text = "Public Repo"
        
        break
        
    case .gists:
        symbolImageView.image = UIImage(systemName: "text.alignleft")
       titleLabel?.text = "Public Gists"
        break
    case .followers:
        
        titleLabel?.text = "Public Followers"
        symbolImageView.image = UIImage(systemName: "person")
        
        break
        
    case .following:
        titleLabel?.text = "Public Following"
        symbolImageView.image = UIImage(systemName: "suit.heart")
        
        break
//    default:
//        <#code#>
    }
        
        countLabel?.text = String(count)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
