//
//  ReuseRepoItemVC.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/4/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit


class ReuseRepoItemVC: ReuseInfoItetmViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureItems ()
        
    
    }
    
    override func clickEmUnBotton() {
        voyADelegara.didTapGitHubProfile(for: user)
    }
    
    
    private func configureItems () {
        
        
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos ?? 0)
        
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGist ?? 0)
        
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
}
