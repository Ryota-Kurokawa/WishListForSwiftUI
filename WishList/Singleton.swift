//
//  Singleton.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import Foundation

class Singleton: ObservableObject {
    static var shared = Singleton()
    @Published var hoge: String = ""
}
