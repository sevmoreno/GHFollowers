//
//  EmptyView.swift
//  GHFollowers
//
//  Created by Juan Moreno on 8/5/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    
    
    let mensajeLabel = ReuseTitle(textAliment: .center, fontSize: 15)
    let logoImageView = UIImageView ()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuracion ()
        
    }
    
    
    init(texto:String) {
        super.init(frame: .zero)
        mensajeLabel?.text = texto
        
         configuracion ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
    
    private func configuracion () {
        
         addSubview(mensajeLabel!)
            addSubview(logoImageView)
            
            mensajeLabel?.numberOfLines = 3
          //  mensajeLabel?.text = "No user information found"
        
            logoImageView.image = UIImage(named: "empty-state-logo")
            mensajeLabel?.translatesAutoresizingMaskIntoConstraints = false
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
            
            
            NSLayoutConstraint.activate([
                
                mensajeLabel!.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                mensajeLabel!.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
                mensajeLabel!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
                mensajeLabel!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
                mensajeLabel!.heightAnchor.constraint(equalToConstant: 300),
                logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, constant: 1.33),
                logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.33),
                logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
                logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 140)
                ])
            
        
        
    }
}
