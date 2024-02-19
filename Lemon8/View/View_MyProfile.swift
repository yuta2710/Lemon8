//
//  MyProfileView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI
import FirebaseAuth

struct MyProfileView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var isShowAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    
    @EnvironmentObject var authVM: UserConfigurationManager
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient:
                                Gradient(
                                    colors: [Color("tertiaryBackground")]),
                               startPoint: .leading,
                               endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                VStack (alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/lemon8-c4d22.appspot.com/o/placeholder_image.png?alt=media&token=55095270-b730-4af9-80cb-7bb4f704ec18"), scale: 2.0) { image in
                            image
                                .resizable()
                                .frame(width: 120, height: 120)
                                .cornerRadius(100)
                        } placeholder: {
                            ProgressView()
                           
                        }
                        VStack (alignment: .leading) {
                            Text("Minh Anh")
                                .foregroundColor(Color.white)
                                .font(.title)
                                .bold()
                            
                            HStack {
                                Text("20 posts")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14.0))
                                
                                Text("300 followers")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14.0))
                                
                                Text("540 followings")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14.0))
                            }
                            .padding(EdgeInsets(top: 0.5, leading: 0, bottom: 0, trailing: 0))
                            
                        }
                    }
                    
                    VStack {
                        Text("About Me")
                            .foregroundColor(.white)
                            .font(.headline)
                            .bold()
                        
                        Text("I love my cats")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack {
                        SolidButton(selectedColor: Color("deep-teal"), buttonTitle: "Edit my profile", buttonAction: {})
                    
                        SolidButton(selectedColor: Color("hot-pink"), buttonTitle: "Message", buttonAction: {})
                        
                    }
                    
                    GradientButton(title: "Log Out", action: {
                        self.authVM.signOut {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }, bgColor: Color("tertiaryBackground"), agColor: [Color.red, Color.blue])
                    
                }
                

            }
            
            .alert(isPresented: $isShowAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel())
            }
            .onAppear() {
                DispatchQueue.main.async {
                    authVM.fetchUser()
                }
            }
        }
    }
}



#Preview {
    MyProfileView()
        .environmentObject(UserConfigurationManager())
}


//                    if authVM.isSignIn() && authVM.currentUser != nil {
//
//
//
//                    }
