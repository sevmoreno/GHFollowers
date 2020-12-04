
//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/17/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager {
    
    // Love you Singelton
    
    static let shared = NetworkManager ()
    
    let baseURL = "https://api.github.com/users/"
    
    
    // https://api.github.com/users/sevmoreno/followers?per_page=100&page=100
    private init () {}
    
    //-----------------------
    
    // Creamos un cache de las imagenes en el singelton ya que sirve.
    // Toma un key value como si fuera un diccionario
    
    let cache = NSCache<NSString,UIImage> ()
    
    
    
    
    
    
    
    
    func getFollowers (for username: String, page: Int, completed: @escaping ([Follower]?,ErrorMessages?) -> Void) {
        
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            
            completed(nil,ErrorMessages.invalidUsername)
            return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error  {
                
                completed(nil,ErrorMessages.unableToComplete)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
                completed(nil, ErrorMessages.invalidResponse)
                return
            }
            
            
            guard let data = data else {completed(nil,ErrorMessages.invalidData)
                return
            }
            
            
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
                
            } catch {
                
                completed(nil,ErrorMessages.invalidData)
                
                
            }
            
        }
        
        task.resume()
    }

    
    
    func getUsers (for username: String, completed: @escaping (Users?,ErrorMessages?) -> Void) {
        
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            
            completed(nil,ErrorMessages.invalidUsername)
            return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error  {
                
                completed(nil,ErrorMessages.unableToComplete)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                
                completed(nil, ErrorMessages.invalidResponse)
                return
            }
            
            
            guard let data = data else {completed(nil,ErrorMessages.invalidData)
                return
            }
            
            
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(Users.self, from: data)
                completed(user,nil)
                
            } catch {
                
                completed(nil,ErrorMessages.invalidData)
                
                
            }
            
        }
        
        task.resume()
    }
    
}
