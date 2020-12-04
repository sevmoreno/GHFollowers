//
//  ReuseAlertViewController.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/16/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseAlertViewController: UIViewController {

    
    let conteinerView = UIView ()
    let titleLabel = ReuseTitle(textAliment: .center, fontSize: 20)
    let messageLaber = ReuseBodyLabel(textAliment: .center)
    let actionButton = ReuseButton(backgroundColor: .systemPink, tittle: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let padding: CGFloat = 20.0
    
    init(alertTitle: String, message: String, buttonTitle: String){
        
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
        
        
        
        configureContainer()
        configuerTitleLabel()
        configureActionButton ()
        
        configureBodyLabel ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)

    }
    
    func  configureContainer() {
        
        view.addSubview(conteinerView)
        conteinerView.backgroundColor       = .systemBackground
        conteinerView.layer.cornerRadius    = 16
        conteinerView.layer.borderWidth     = 2
        conteinerView.layer.borderColor     = UIColor.white.cgColor
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            conteinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            conteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 280),
            conteinerView.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        
    }
    
    func configuerTitleLabel () {
        
        conteinerView.addSubview(titleLabel!)
               titleLabel!.text = alertTitle ?? "Something went wrong"
                titleLabel?.textAlignment = .center
               NSLayoutConstraint.activate([
                   titleLabel!.topAnchor.constraint(equalTo: conteinerView.topAnchor, constant: padding),
                   titleLabel!.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: padding),
                   titleLabel!.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -padding),
                   titleLabel!.heightAnchor.constraint(equalToConstant: 28)
               ])
        
    }
    
    func configureActionButton () {
        
        
        conteinerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: conteinerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    @objc func dismissVC () {
        
        self.dismiss(animated: true)
    }
    
    func configureBodyLabel () {
        
        conteinerView.addSubview(messageLaber!)
        messageLaber?.text = message ?? "Unable to complete request"
        messageLaber?.numberOfLines = 4
        
        
        NSLayoutConstraint.activate([
        
            messageLaber!.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 8),
            messageLaber!.leadingAnchor.constraint(equalTo: conteinerView.leadingAnchor, constant: padding),
            messageLaber!.trailingAnchor.constraint(equalTo: conteinerView.trailingAnchor, constant: -padding),
            messageLaber!.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        
        
        
        ])
        
    }

}
