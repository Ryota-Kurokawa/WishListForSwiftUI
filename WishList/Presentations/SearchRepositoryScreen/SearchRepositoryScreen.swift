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
    let apiClient: ApiClientRepositoryProtocol = ApiClientRepository()
    
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
                        repositories = try await apiClient.fetchRepositories(keyword: keyword)
                        print(repositories.description)
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
