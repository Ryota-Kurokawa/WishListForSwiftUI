//
//  Button+Async.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/19.
//

import SwiftUI

extension Button {
    init(asyncAction: @escaping @Sendable () async -> Void, label: () -> Label) {
        self.init(action: {
            Task { @MainActor in
                await asyncAction()
            }
        }, label: label)
    }
}
