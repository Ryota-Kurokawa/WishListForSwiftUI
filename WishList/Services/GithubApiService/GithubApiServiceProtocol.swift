//
//  GithubApiServiceProtocol.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import Foundation

protocol GithubApiServiceProtocol {
    
    func searchRepositories(keyword: String) async throws
}
