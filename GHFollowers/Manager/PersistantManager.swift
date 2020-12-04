//
//  PersistantManager.swift
//  GHFollowers
//
//  Created by Juan Moreno on 9/20/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import Foundation

enum PersistanceActionType {
    
    case add, remove
}

enum PersistanceManager {
    
    
    // Every time que salvas algo en el User defaults
    // Tenes que enconde or decoder
    //
    
    
    static private let defaults = UserDefaults.standard
    
    enum Key {
        
        static let favorites = "favorites"
    }
    
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, competed: @escaping (Error?) -> Void) {
        
        retriveFavorites { result in
            switch result {
                
            case .success(let favorites):
                
                var retriveFavorites = favorites
                
                switch actionType {
                case .add:
                    
                    guard !retriveFavorites.contains(favorite) else {
                        competed("already" as! Error)
                        return
                    }
                    retriveFavorites.append(favorite)
                    
                    
                case .remove:
                    
                    retriveFavorites.removeAll { $0.login == favorite.login
                    }
                    
               
                }
                
                competed(save(favorites: favorites))
                
             
            case .failure(let error):
                
                competed(error)
               
            }
        }
    }
    
    
    static func retriveFavorites(completed: @escaping (Result<[Follower], Error>) -> Void)
    
    {
        guard let favoriteData = defaults.object(forKey: Key.favorites) as? Data else { completed(.success([]))
            return
        }
        
        // Same proces as network
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoriteData)
            completed(.success(favorites))
        } catch {
            
            completed(.failure("Error w/ users" as? Error as! Error))
        }
    }
    
    static func save(favorites: [Follower]) -> Error? {
        
        do {
            
            let enconder = JSONEncoder ()
            
            let encondedFavorites = try enconder.encode(favorites)
            defaults.set(encondedFavorites, forKey: Key.favorites)
        } catch {
            
            return ("Unable to Favorites" as! Error)
        }
        
        return nil
    }
}


