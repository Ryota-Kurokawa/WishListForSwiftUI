//
//  ApiClientProtocol.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import Foundation

protocol GithubRepositoryRepositoryProtocol {
    func fetchRepositories(keyword: String) async throws -> [Repository]
}
