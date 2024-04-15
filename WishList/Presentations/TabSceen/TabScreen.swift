//
//  TabScreen.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/14.
//

import SwiftUI

struct TabScreen: View {
    var body: some View {
        TabView {
            ReadArticleScreen()
                .tabItem {
                    Image(systemName: "book")
                    Text("Read Articles")
                }
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    TabScreen()
}
