//
//  View_AddNewPostPreviewer.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 18/02/2024.
//

import SwiftUI

struct PostDetailsPreviewer: View {
    @State var post: PostEntity
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                AsyncImage(url: URL(string: post.photo), scale: 1.5) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }
                
                VStack (alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: post.photo), scale: 1.5) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .cornerRadius(50)
                                    
                                    .frame(width: 50, height: 50)
                            case .failure:
                                Image("placeholder_avatar")
                            @unknown default:
                                EmptyView()
                            }
                            
                        }
                        Text("Minh Anh")
                            .font(.headline)
                            .bold()
                            .offset(x: 8)
                        
                        
                    }
                    .padding()
                    
                    VStack (alignment: .leading) {
                        Text("Beautiful Mistake")
                            .font(.headline)
                            .bold()
                        
                        Text("This is the best bro")
                            .font(.subheadline)
                            .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                        
                        Text("5 minutes ago")
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.4))
                            .padding(EdgeInsets(top: 1, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                }
                
            }
        }
    }
}
#Preview {
    PostDetailsPreviewer(post: .init(id: "", heading: "Gợi ý 4 mẫu nail hoạ tiết gợn sóng tối giản", content: "Một mẫu nial đơn giản dành cho các nàng yêu sự đơn giản trên đôi tay mình. Nhân vật chính hôm nay là mẫu hoạt tiết gợn sóng kết hợp cùng màu ngọc trai vô cùng lấp lánh tạo hiệu như một dãy màu cực quang", hashtags: ["nail", "nails", "lime", "lemon8", "MyBestSkincare"], photo: "https://firebasestorage.googleapis.com/v0/b/lemon8-c4d22.appspot.com/o/girl_3.png?alt=media&token=7c5338df-9667-4dd8-bc8f-ca4d785ab832"))
}
