//
//  UI_PostCardTemplate.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 18/02/2024.
//

import SwiftUI

struct UI_PostCardTemplate: View {
    @StateObject private var newfeedsVM = NewfeedsViewModel()
    @State private var posts: [PostEntity] = []
    @State private var coordinatorX: CGFloat = 0
    @State private var screens = UIScreen.main.bounds.width - 30
    
    var body: some View {
        VStack {
            
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
    UI_PostCardTemplate()
}
