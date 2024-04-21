//
//  ProfileController.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/18.
//

import Foundation

class ProfileController: ObservableObject {
    @Published var userInfo: UserInfo?
    
    @MainActor
    func searchUser(userName:String) async -> UserInfo {
        let apiURL = URL(string: "https://api.github.com/users/\(userName)") ?? URL(string: "https://api.github.com/users/")!
        let (data, _) = try! await URLSession.shared.data(from: apiURL)
        userInfo = try! JSONDecoder().decode(UserInfo.self, from: data)
        return userInfo ?? UserInfo(login: "", url: "https://api.github.com/users/", avatar_url: "", html_url: "")
    }
}
