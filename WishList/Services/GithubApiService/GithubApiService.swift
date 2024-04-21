//
//  GithubApiService.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import Foundation

class GithubApiService: GithubApiServiceProtocol {
    init() {}
    
    func searchRepositories(keyword: String) async throws {
        let res = try await URLSession.shared.data(from: URL(string: "https://api.github.com/search/repositories?q=\(keyword)")!)
        print(res)
    }
}

