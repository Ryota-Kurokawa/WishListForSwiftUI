//
//  ReadArticleController.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/18.
//

import Foundation

class ReadArticleController: ObservableObject {
    @Published var users: [UserInfo] = []
    
    func getUsers() {
        if let apiURL = URL(string:"https://api.github.com/search/users?q=greg") {
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let userData = data {
                    if let usersFromAPI = try? JSONDecoder().decode(github.self, from: userData) {
                        DispatchQueue.main.async {
                            self.users = usersFromAPI.items
                        }
                    }
                }
            }.resume()
        }
    }
}

