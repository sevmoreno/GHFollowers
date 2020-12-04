//
//  SearchVC.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/9/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let imagen = UIImageView ()
    let textIngreso = ReuseTextField ()
    let callToActionBT = ReuseButton(backgroundColor: .systemGreen, tittle: "Get Followers")
    
    
    
    // Computer property se llama a esto
    
    var isUserNameIsEmpty: Bool  {
        
        print(textIngreso.text!)
        return textIngreso.text!.isEmpty
    }
    
    
    override func viewDidLoad() {
        
        // vviewDidLoad solo al cargarlo
        
        super.viewDidLoad()

             view.backgroundColor = .systemBackground
        
        configLogo ()
        configureTextView ()
        configureButton ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // viewWillApper cada vez que va a aparecer se ejecuta
        super.viewWillAppear(true)
        
        navigationController?.isToolbarHidden = true
    }

    func configLogo () {
        
        view.addSubview(imagen)
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            imagen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80.0),
            imagen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagen.heightAnchor.constraint(equalToConstant: 200),
            imagen.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        
    }
    
    func configureTextView () {
        
        view.addSubview(textIngreso)
        
        // HEY PRESTA ATENCION lo qu ete en el seft (view controller) cuando se use este textview.
        textIngreso.delegate = self
//textIngreso.backgroundColor = .systemBlue
        NSLayoutConstraint.activate([
        
            textIngreso.topAnchor.constraint(equalTo: imagen.bottomAnchor, constant: 40),
            textIngreso.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            textIngreso.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            textIngreso.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }
    
    @objc func pushFollowerListVC () {
        
        guard  !isUserNameIsEmpty else {
            
            // comand + controll + Space bar for emoji
            presentReuserAlertInMainTreath(title: "Empty Username", message: "Please enter a username. 😎", buttonTitle: "Ok")
            print("No user name")
            return
        }
        let followerVC = FollowerVC ()
        
        followerVC.username = textIngreso.text
        followerVC.title    = textIngreso.text
        
        navigationController?.pushViewController(followerVC, animated: false)
        
    }
    
    func createDismissKeyboard () {
     
         let tap = UITapGestureRecognizer (target: self.view, action: #selector(UIView.endEditing))
         
         // UIView, resing firs responder
         view.addGestureRecognizer(tap)
        
        
         
        
         

     
     }
    
    func configureButton () {
        
        view.addSubview(callToActionBT)
        
        callToActionBT.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        //textIngreso.backgroundColor = .systemBlue
                NSLayoutConstraint.activate([
                
                    callToActionBT.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
                    callToActionBT.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -50),
                    callToActionBT.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 50),
                    callToActionBT.heightAnchor.constraint(equalToConstant: 50)
                   
                ])
        
    }
    
    
}


// ahora que presatste atencion hace esto

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        pushFollowerListVC()
        print("TRuee ")
         return true
        
    }
    
    
    
}
