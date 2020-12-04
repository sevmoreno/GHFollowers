//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/17/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import Foundation
import SafariServices
import UIKit

// Si fueran bottones especificos hariamos subclassing pero al ser que lo vamos a usar en todos hacemos una extension
fileprivate var containerView: UIView!

extension UIViewController {
    
    // como no se puede hacer variables en las extensiones creamos un fileprivate que deja qu se vea en el file
    
    
    
    func presentSafariVC( _ url: URL) {
        
        
        let safariVC = SFSafariViewController(url: url)
               safariVC.preferredControlTintColor = .systemGreen
               navigationController?.pushViewController(safariVC, animated: true)
    }

    
    
    
    
    
    func presentReuserAlertInMainTreath (title: String, message: String, buttonTitle: String) {
        
        DispatchQueue.main.async {
            
            let alertVC = ReuseAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
            
            
            
            
        }
        
        
    }
    
    
    func showLoadingView () {
        
        containerView = UIView(frame: view.bounds)
        
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0.0
        
        UIView.animate(withDuration: 0.25) {
            
            containerView.alpha = 0.8
        }
        
        let activiyIndicatior = UIActivityIndicatorView(style: .large)
        
        containerView.addSubview(activiyIndicatior)
        
        activiyIndicatior.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activiyIndicatior.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              activiyIndicatior.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
        
        activiyIndicatior.startAnimating()
        
    }
    
    
    func stopLoadingView() {
        
        DispatchQueue.main.async {
            
            containerView.removeFromSuperview()
            containerView = nil
            
        }
    
        
        
        
    }
    
    func showEmptyUser (with message: String, in view: UIView) {
        
        let empty = EmptyView(texto: message)
        empty.frame = view.frame
        view.addSubview(empty)
        
    }
}
