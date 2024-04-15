//
//  ContentView.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/10.
//

import SwiftUI

struct ReadArticleScreen: View {
    @State var num = 0

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ReadArticleScreen()
}
