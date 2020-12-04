//
//  ReuseTextField.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/9/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray3.cgColor
        textColor = .label
        // Tint color es el cursor
        
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        
        // ajusta el texto
        adjustsFontSizeToFitWidth = true
        
        // pero como minimo 12
        
        minimumFontSize = 12
        keyboardType = .default
        returnKeyType = .go
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder = "Enter your username"
        
    }
}
