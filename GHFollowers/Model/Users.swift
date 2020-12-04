//
//  Users.swift
//  GHFollowers
//
//  Created by Juan Moreno on 6/17/20.
//  Copyright © 2020 Juan Moreno. All rights reserved.
//

import Foundation

struct Users: Codable {
    
    var login: String
    var avatarUrl:String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int?
    var publicGist: Int?
    var htmlUrl: String?
    var following: Int
    var followers: Int
    var createdAt: String
    
    
}
