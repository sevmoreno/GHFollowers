//
//  ReuseAvatarImageView.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/30/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import UIKit

class ReuseAvatarImageView: UIImageView {


    let placeholderImage = UIImage(named: "avatar-placeholder")!
    
    let cash = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        congigure ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  congigure () {
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    func downloadImage(from urlString: String) {
        
        let cashString = NSString(string: urlString)
        
        if let image = cash.object(forKey: cashString) {
            
            self.image = image
            
            return
            
            
        }
        
        
        
        guard let url = URL(string: urlString) else {return}
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let _ = error  {
                
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
               
                return
            }
            
            
            guard let data = data else {
                return
            }
            
            
            
            // codigo
            
            guard let image = UIImage(data: data) else { return}
            
            
            self.cash.setObject(image, forKey: cashString)
            
            DispatchQueue.main.async {
                
                self.image = image
            }
            
            
            
            
            
            
            
            
        }
        
        task.resume()
        
        
        
        
    }
}


