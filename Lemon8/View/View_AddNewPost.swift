//
//  AddNewPostView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI
import PhotosUI

struct AddNewPostView: View {
    @StateObject private var postVM: PostViewViewModel = PostViewViewModel()
    @State private var isBackToNewfeeds: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Text("")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            ZStack {
                                HStack{
                                    Image(systemName: "arrow.backward")
                                        .resizable()
                                        .foregroundStyle(.linearGradient(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 25, height: 20)
                                    Spacer()
                                    Image(systemName: "eye.fill")
                                        .resizable()
                                        .foregroundStyle(.linearGradient(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 40, height: 23)
                                }
                                Text("Add New Post")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        }
                    }
                LinearGradient(gradient:
                                Gradient(
                                    colors: [Color("tertiaryBackground")]),
                               startPoint: .leading,
                               endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                VStack {
                    ScrollView(.horizontal) {
                        HStack (spacing: 20) {
                            ForEach(0..<postVM.images.count, id: \.self) { i in
                                Image(uiImage: postVM.images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(5.0)
                            }
                            PhotosPicker(
                                selection: $postVM.photosPickerItem,
                                
                                maxSelectionCount: 5,
                                selectionBehavior: .ordered, matching: .images) {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .foregroundStyle(.linearGradient(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .top, endPoint: .bottom))
//                                    CircleWithGradientIconButton()
                                }
                        }
                        .padding()
                    }
                    
                    
                    VStack (alignment: .leading) {
                        GradientText(title: "Beauty - Làm đẹp")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                        
                        LazyVGrid(columns: [GridItem(.fixed(100), spacing: 0), GridItem(.fixed(100), spacing: 0), GridItem(.fixed(100), spacing: 0)],
                                  spacing: 8) {
                            ForEach(0 ..< 5) { item in
                                Text("#b\(item + 1)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold))
                                
                                
                            }
                        }
                                  .frame(width: 300)
                        
                        GradientText(title: "How’s your day going?")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                        
                        Text("In simple words, ‘Beauty’ is what gladdens the heart. Neither a symmetrical face nor a shapely body—If the sight of you generates happiness, you’re beautiful. —Adeel Ahmed Khan")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    }
                    GradientButton(
                        title: "Post",
                        action: {
                            postVM.uploadNewPost(heading: "Làm đẹp cực nứng", content: "In simple words, ‘Beauty’ is what gladdens the heart. Neither a symmetrical face nor a shapely body—If the sight of you generates happiness, you’re beautiful. —Adeel Ahmed Khan", hashtags: ["nungggggg", "lozzzzzzz"])
                            self.isBackToNewfeeds.toggle()
                            
                        },
                        bgColor: Color("secondaryBackground"),
                        agColor: [Color.red, Color.blue])
                    
                }
                .onChange(of: postVM.photosPickerItem) { _, _ in
                    Task {
                        postVM.photosPickerItem.removeAll() // Remove all selection after turn off photo sheet
                    }
                }
                
            }
        }
        .fullScreenCover(isPresented: $isBackToNewfeeds){
            ContentView()
        }
        
    }
}

#Preview {
    AddNewPostView()
}
