//
//  NewfeedsView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct NewfeedsView: View {
    @StateObject private var newfeedsVM = NewfeedsViewModel()
    @State private var posts: [PostEntity] = []
    @State private var coordinatorX: CGFloat = 0
    @State private var screens = UIScreen.main.bounds.width - 30 
    
    var body: some View {
        List {
            ForEach (newfeedsVM.posts.sorted(by: {$0.createdAt < $1.createdAt}), 
                     id: \.id) { post in
                PostDetailsPreviewer(post: post)
            }
        }
        .onAppear() {
            Task {
                do {
                    try await newfeedsVM.fetchPosts()
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    NewfeedsView()
}
