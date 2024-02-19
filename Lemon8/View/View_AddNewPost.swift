//
//  AddNewPostView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI
import PhotosUI

struct AddNewPostView: View {
    @State private var images: [UIImage] = []
    @State private var photosPickerItem: [PhotosPickerItem] = []
    @State private var isOpenSheet: Bool = false
    
    
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
                            ForEach(0..<images.count, id: \.self) { i in
                                Image(uiImage: images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(5.0)
                            }
                            PhotosPicker(
                                selection: $photosPickerItem,
                                maxSelectionCount: 5,
                                selectionBehavior: .ordered) {
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
                        action: {},
                        bgColor: Color("secondaryBackground"),
                        agColor: [Color.red, Color.blue])
                    
                }
                .onChange(of: photosPickerItem) { _, _ in
                    Task {
                        for item in photosPickerItem {
                            if let data = try? await item.loadTransferable(type: Data.self) {
                                if let image = UIImage(data: data) {
                                    images.append(image)
                                }
                            }
                        }
                        
                        photosPickerItem.removeAll()
                    }
                }
                
            }
        }
        
        
    }
}

#Preview {
    AddNewPostView()
}
