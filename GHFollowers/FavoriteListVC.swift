//
//  FavoriteListVC.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/9/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class FavoriteListVC: UIViewController {
    
    
   // var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue

     let doneButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
            
            navigationItem.rightBarButtonItem = doneButton
    }
    

    @objc func dismissVC () {
        
        self.dismiss(animated: true, completion: nil)
    }

}
