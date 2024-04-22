//
//  GithubRepositoryServiceProtocol.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/22.
//

import Foundation

protocol GithubRepositoryServiceProtocol {
    func fetchRepositories(keyword: String) async throws -> Repositories
}
