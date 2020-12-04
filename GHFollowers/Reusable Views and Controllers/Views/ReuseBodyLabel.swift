//
//  ReuseBodyLabel.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/16/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

 import UIKit

    class ReuseBodyLabel: UILabel {

        override init(frame: CGRect) {
            super.init(frame: frame)
            
            configure ()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        init? (textAliment: NSTextAlignment) {
            
            super.init(frame: .zero)
            self.textAlignment = textAlignment
          
            configure ()
            
        }
        
        private func configure () {
            
            textColor = .secondaryLabel
            adjustsFontSizeToFitWidth = true
            minimumScaleFactor = 0.75
            lineBreakMode = .byWordWrapping
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.preferredFont(forTextStyle: .body)
            
            
        }

    }


