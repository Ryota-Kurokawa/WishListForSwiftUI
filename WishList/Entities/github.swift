//
//  github.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/17.
//

import Foundation

struct github: Codable {
    var items: [UserInfo]
}

struct Repository: Codable {
    var id: Int
    var name: String
    var url: String
    var owner: UserInfo
}

struct Repositories: Codable {
    var items: [Repository]
}
