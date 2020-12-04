//
//  ReuseTitle.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/16/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseTitle: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init? (textAliment: NSTextAlignment,fontSize: CGFloat ) {
        
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure ()
        
    }
    
    private func configure () {
        
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }

}
