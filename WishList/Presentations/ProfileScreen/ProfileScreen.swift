//
//  Profile.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/14.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
            Text("User Name")
                .font(.title)
        }
    }
}

#Preview {
    ProfileScreen()
}
