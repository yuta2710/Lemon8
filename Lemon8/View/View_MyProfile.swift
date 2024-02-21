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
                    if authVM.isSignIn() {
                        HStack {
                            AsyncImage(url: URL(string: authVM.currentUser!.avatar), scale: 2.0) { image in
                                image
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(100)
                            } placeholder: {
                                ProgressView()
                               
                            }
                            VStack (alignment: .leading) {
                                Text(authVM.currentUser!.name)
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .bold()
                                
                                VStack (alignment: .leading) {
                                    HStack (spacing: 6.0) {
                                        GradientText(title: "450")
                                            .font(.system(size: 14.0))
                                            .bold()
                                        Text("posts")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14.0))
                                    }
                                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                                    
                                    HStack (spacing: 6.0)  {
                                        GradientText(title: "300")
                                            .font(.system(size: 14.0))
                                            .bold()
                                        Text("followers")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14.0))
                                    }
                                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                                    
                                    
                                    HStack (spacing: 6.0)  {
                                        GradientText(title: "540")
                                            .font(.system(size: 14.0))
                                            .bold()
                                        Text("Followings")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 14.0))
                                    }
                                    .padding(EdgeInsets(top: 2, leading: 0, bottom: 0, trailing: 0))
                                }
                                .padding(EdgeInsets(top: 0.5, leading: 0, bottom: 0, trailing: 0))
                                
                            }
                        }
                        .padding()
                        
                        VStack (alignment: .leading) {
                            Text("About Me")
                                .foregroundColor(.white)
                                .font(.headline)
                                .bold()
                                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                            
                            Text(authVM.currentUser!.biography)
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
