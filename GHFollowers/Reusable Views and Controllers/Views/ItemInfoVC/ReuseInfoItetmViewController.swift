//
//  ReuseInfoItetmViewController.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/4/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseInfoItetmViewController: UIViewController {
    
    
    let stackView = UIStackView ()
    let itemInfoViewOne = ReuseItemInfoView ()
    let itemInfoViewTwo = ReuseItemInfoView ()
    let actionButton = ReuseButton()
    
    var user: Users!
    
    var voyADelegara: UserInfoVCDelegate!
    
    init(user: Users) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBackgroundView ()
        layoutUI ()
        configureStackView ()
        
        configureActionBTN ()
    }
    

    func configureBackgroundView () {
        
        
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureActionBTN () {
        
        actionButton.addTarget(self, action: #selector(clickEmUnBotton), for: .touchUpInside)
        
        
        
    }
    
    @objc func clickEmUnBotton()  {
        
        
    }
    
    func layoutUI () {
        
        view.addSubview(stackView)
        view.addSubview(actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        var padding: CGFloat = 20
        
        
        NSLayoutConstraint.activate([
        
        
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),
        
        ])
        
        
    }
    
    
    func configureStackView () {
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
        
        
    }

}
