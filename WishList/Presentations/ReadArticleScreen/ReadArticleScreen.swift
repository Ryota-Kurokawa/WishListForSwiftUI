//
//  ContentView.swift
//  WishList
//
//  Created by 黒川良太 on 2024/04/10.
//

import SwiftUI

struct ReadArticleScreen: View {
    let url = URL(string: "https://api.github.com/users/Ryota-Kurokawa")
    @State var userName: String = ""

    var body: some View {
        VStack {
            Text("API Test")
                .font(.title)
                .padding()
            Button("Github Fetch") {
                fetchData()
            }
            Text(userName)
        }
    }
    func fetchData() {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        self.userName = decodedData.name ?? "Unknown"
                    }
                    return
                }
            }
        }.resume()
    }
}

struct User: Codable {
    let name: String?
}

#Preview {
    ReadArticleScreen()
}
