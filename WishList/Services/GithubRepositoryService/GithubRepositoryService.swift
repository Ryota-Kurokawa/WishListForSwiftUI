//
//  GithubRepositoryService.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/22.
//

import Foundation

class GithubRepositoryService: GithubRepositoryServiceProtocol, ObservableObject {
    let githubRepository: GithubRepositoryRepositoryProtocol = GithubRepositoryRepository()
    var repositories: [Repository] = []
    
    
    func fetchRepositories(keyword: String) async throws -> Repositories {
        let repositories = try await githubRepository.fetchRepositories(keyword: keyword)
        return Repositories(items: repositories)
    }
}
