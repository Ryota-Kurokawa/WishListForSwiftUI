//
//  ApiClient.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/16.
//

import Foundation

class GithubRepositoryRepository: GithubRepositoryRepositoryProtocol, ObservableObject {
    @Published var repositories: [Repository] = []
    
    
    func fetchRepositories(keyword: String) async throws -> [Repository] {
        if let fetchUrl = URL(string: "https://api.github.com/search/repositories?q=\(keyword)") {
            var request = URLRequest(url: fetchUrl)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let userData = data {
                    if let usersFromAPI = try? JSONDecoder().decode(Repositories.self, from: userData) {
                        DispatchQueue.main.async {
                            self.repositories = usersFromAPI.items
                        }
                    }
                }
            }.resume()
        }
        return repositories
    }
}
