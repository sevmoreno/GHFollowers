//
//  ReuseButton.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/9/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseButton: UIButton {

    override init(frame: CGRect) {
       
        super.init(frame: frame)
        
        
        configure()
        
        
    }
    
    init(backgroundColor: UIColor, tittle: String) {
        
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitle(tittle, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    func set(backgroundColor: UIColor, title: String) {
        
        self.backgroundColor = backgroundColor
        
        self.setTitle(title, for: .normal)
        
        
    }
    
}
