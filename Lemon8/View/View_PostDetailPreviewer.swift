//
//  View_AddNewPostPreviewer.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 18/02/2024.
//

import SwiftUI

struct PostDetailsPreviewer: View {
    @State var post: PostEntity
    @State var owner: UserEntity = .init(id: "", name: "", username: "", email: "", biography: "", gender: Gender.Male, age: 18, area: "", tiktok: "", instagram: "", twitter: "", youtube: "", yourWebsite: "", followers: [], followings: [], posts: [], avatar: "")
    
    @StateObject var userManagerService: UserManagerService = UserManagerService()
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center, spacing: 20) {
                        ForEach(post.photo.keys.sorted(), id: \.self) { key in
                            if let imageUrl = post.photo[key], let url = URL(string: imageUrl) {
                                AsyncImage(url: url, scale: 1.5) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 420)// Adjust the width as needed
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 300, height: 420) // Same size as the image for consistency
                                }
                            }
                        }
                    }
                }
                
                VStack (alignment: .leading) {
                    HStack {
                        
//                        AsyncImage(url: URL(string: owner.), scale: 1.5) { phase in
//                            switch phase {
//                            case .empty:
//                                ProgressView()
//                            case .success(let image):
//                                image
//                                    .resizable()
//                                    .cornerRadius(50)
//                                
//                                    .frame(width: 50, height: 50)
//                            case .failure:
//                                Image("placeholder_avatar")
//                            @unknown default:
//                                EmptyView()
//                            }
//                            
//                        }
                        Text("Minh Anh")
                            .font(.headline)
                            .bold()
                            .offset(x: 8)
                        
                        
                    }
                    .onAppear() {
                        DispatchQueue.main.async {
                            userManagerService.getUserById(from: post.userId) { [self] (owner, error) in
                                if let error = error {
                                    return
                                }
                                
                                self.owner = owner!
                            }
                        }
                    }
                    .padding()
                    
                    VStack (alignment: .leading) {
                        Text(post.heading)
                            .font(.headline)
                            .bold()
                        
                        Text(post.content)
                            .font(.subheadline)
                            .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                        
                        Text(post.createdAt.convertToDateFormatForUIDisplay())
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.4))
                            .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity)
        }
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    PostDetailsPreviewer(
        post: .init(id: "",
                    heading: "Gợi ý 4 mẫu nail hoạ tiết gợn sóng tối giản",
                    content: "Một mẫu nial đơn giản dành cho các nàng yêu sự đơn giản trên đôi tay mình. Nhân vật chính hôm nay là mẫu hoạt tiết gợn sóng kết hợp cùng màu ngọc trai vô cùng lấp lánh tạo hiệu như một dãy màu cực quang",
                    hashtags: ["nail", "nails", "lime", "lemon8", "MyBestSkincare"],
                    photo: ["308984D2-3A88-425B-98D5-C89598FCACCB": "https://firebasestorage.googleapis.com:443/v0/b/lemon8-c4d22.appspot.com/o/posts%2FGhVupJMtcCd0Bw8NywMREWuaJFF3%2F912A4C0E-DA0A-4563-AA65-0879FAF0C69B%2F308984D2-3A88-425B-98D5-C89598FCACCB_4.jpeg?alt=media&token=70694695-2339-4020-8039-198d33c8d4d1"], 
                    userId: "GhVupJMtcCd0Bw8NywMREWuaJFF3",
                    createdAt: Date().timeIntervalSince1970,
                    updatedAt: Date().timeIntervalSince1970)
//        owner:
    )
    .environmentObject(UserConfigurationManager())
    //    var feedVM = NewfeedsViewModel()
    //    Task {
    //        do {
    //            try await feedVM.fetchPosts()
    //        }catch {
    //            print(error.localizedDescription)
    //        }
    //    }
    //
    //    PostDetailsPreviewer(post: .init(id: feedVM.posts[0].id, heading: feedVM.posts[0].heading, content: feedVM.posts[0].content, hashtags: feedVM.posts[0].hashtags, photo: feedVM.posts[0].photo, userId: feedVM.posts[0].userId, createdAt: Date().timeIntervalSince1970, updatedAt: Date().timeIntervalSince1970))
    //        .environmentObject(UserConfigurationManager())
}
