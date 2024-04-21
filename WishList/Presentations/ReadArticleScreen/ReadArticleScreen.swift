//
//  ContentView.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/10.
//

import SwiftUI

struct ReadArticleScreen: View {
    
    @ObservedObject var controller = ReadArticleController()
    
    
    var body: some View {
        NavigationStack {
            if controller.users.count == 0 {
                VStack{
                    ProgressView().padding()
                    Text("Fetching Users...")
                }
                .onAppear(){
                    controller.getUsers()
                }
            }
            else{
                List(controller.users, id: \.login) { user in
                    Link(destination: URL(string: user.html_url)!) {
                        HStack{
                            AsyncImage(url: URL(string: user.avatar_url)) { response in
                                switch response {
                                case .success(let image):
                                    image.resizable().frame(width: 50, height: 50)
                                default:
                                    Image(systemName: "nosign")
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(user.login)
                                Text(user.url)
                                    .font(.system(size: 11))
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

#Preview {
    ReadArticleScreen()
}
