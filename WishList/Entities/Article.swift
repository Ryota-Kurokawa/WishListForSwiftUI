//
//  Article.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/14.
//

import Foundation

struct Article: Codable {
    var id: String
    var title: String
    var url: String
    var user: User

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.user = try container.decode(User.self, forKey: .user)
    }
}
