//
//  SearchRepositoryScreen.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/21.
//

import SwiftUI

struct SearchRepositoryScreen: View {
    @State private var keyword: String = ""
    @State var repositories: [Repository] = []
    let controller = SearchRepositoryController()
    
    var body: some View {
        VStack {
            Text("SearchRepositoryScreen")
            TextField("Enter keyword", text: $keyword)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                .padding(.top, 10)
            Button {
                Task {
                    do {
                        let repositories = try await controller.githubRepositoryService.fetchRepositories(keyword: keyword)
                        print(repositories)
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Search")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    SearchRepositoryScreen()
}
