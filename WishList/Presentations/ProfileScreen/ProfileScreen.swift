//
//  Profile.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/14.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var controller = ProfileController()
    @State var userName = "Ryota-Kurokawa"
    @State var userInfo: UserInfo = UserInfo(login: "", url: "", avatar_url: "", html_url: "")
    
    var body: some View {
        VStack {
            TextField("Search User", text: $userName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
            Button(asyncAction: { @MainActor in
                userInfo = await self.controller.searchUser(userName: userName)
            }) {
                Text("Search")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if controller.userInfo != nil {
                
                Text(userInfo.login)
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Text(userInfo.url)
                Button(action: {
                    UIApplication.shared.open(URL(string: userInfo.html_url) ?? URL(string: "https://github.com")!)
                }, label: {
                    Text("Open GitHub")
                })
                AsyncImage(url: URL(string: userInfo.avatar_url)) { response in
                    switch response {
                    case .success(let image):
                        image.resizable().frame(width: 50, height: 50)
                    default:
                        Image(systemName: "nosign")
                    }
                }
            } else {
                Text("No User")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
