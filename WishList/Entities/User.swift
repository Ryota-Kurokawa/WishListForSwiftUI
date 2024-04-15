//
//  UserInfo.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/14.
//

import Foundation

struct User: Codable {
    var id: String
    var profileImageUrl: String

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
    }
}
