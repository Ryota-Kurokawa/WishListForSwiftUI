//
//  SearchRepositoryController.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import Foundation

class SearchRepositoryController {
    let githubRepositoryService: GithubRepositoryServiceProtocol = GithubRepositoryService()
    var repositories: [Repository] = []
    
    func fetchRepositories(keyword: String) async throws -> Repositories {
        let repositories = try await githubRepositoryService.fetchRepositories(keyword: keyword)
        return repositories
    }
}
