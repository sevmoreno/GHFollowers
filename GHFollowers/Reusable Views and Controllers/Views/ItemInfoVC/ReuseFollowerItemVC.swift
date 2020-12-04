//
//  ReuseFollowerItemVC.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/4/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit


class ReuseFollowerItemVC: ReuseInfoItetmViewController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
         
         
         configureItems ()
         
     
     }
     
     
     private func configureItems () {
         
         
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers )
         
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following )
         
         actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
     }
    
    override func clickEmUnBotton() {
        voyADelegara.didTapGetFollower(for: user)
    }
}
