//
//  AuthenticationView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject private var authVM = UserConfigurationManager()
    
    @State private var email: String = "digivantrix@gmail.com"
    @State private var password: String = "phucloi2710"
    @State private var isShowAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var shouldNavigateToProfileView: Bool = false
    @State private var isSignUp: Bool = true
    @State private var rotationAngle: Double = 0.0
    @State private var isFade: Bool = true
    @FetchRequest(sortDescriptors:
                    [NSSortDescriptor(keyPath: \Account.userSince,
                                      ascending: true)])
    private var accountStorage: FetchedResults<Account>
    
    private let generator = UISelectionFeedbackGenerator()
    
    @EnvironmentObject var userConfigManager: UserConfigurationManager
    
    var body: some View {
        ZStack(alignment: .leading) {
//            LinearGradient(gradient:
//                            Gradient(
//                                    colors: [Color("pale-sky"), Color("silver-blue")]),
//                                    startPoint: .leading,
//                                    endPoint: .trailing)
//                .edgesIgnoringSafeArea(.all)
            Image(isSignUp ? "background-1" : "background-2")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Lemon8")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
//                        .foregroundColor(Color("deep-teal"))
                    
                    
                    Text(isSignUp ? "Sign up for Lemon8" : "Sign In to Lemon8")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding()
                
                HStack {
                    // Input_Email
                    TextField("", text: $email)
                        .textFieldStyle(
                            CustomTextFieldStyle(
                                placeholder: "Email",
                                placeholderColor: Color.white,
                                placeholderBgColor: .clear,
                                isEditing: !self.email.isEmpty
                            )
                        )
                        .textContentType(.emailAddress)
                }
                .padding()
                .frame(height: 52)
                
         
                ZStack(alignment: .leading) {
                    // Label_Password
                    Text("Password")
                        .font(.system(size: !self.password.isEmpty ? 14 : 16, design: .rounded))
                        .foregroundColor(Color.white)
                        .padding(.horizontal, !self.password.isEmpty ? 18 : 16)
                        .background(.clear)
                        .offset(y: !self.password.isEmpty ? -40 : 0)
                        .scaleEffect(!self.password.isEmpty ? 0.9 : 1, anchor: .leading)
                    
                    // Input_Password
                    SecureField("", text: $password)
                        .foregroundColor(.white)
                        .font(.system(size: 16, design: .rounded))
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .textContentType(.password)
                    
                    
                       
                }
                .frame(height: 52)
                .animation(.easeOut, value: !self.password.isEmpty)
                .background(
                    RoundedRectangle(cornerRadius: 10.0)
                        .stroke(!self.password.isEmpty
                                ? Color.black.opacity(0.6)
                                : Color.black.opacity(0.3),
                                lineWidth: 1)
                )
                .padding(.horizontal, 16)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.5)){
                        self.isFade.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.isFade.toggle()
                            }
                        }
                    }
                    withAnimation(.easeInOut(duration: 1)) {
                        self.isSignUp.toggle()
                        self.rotationAngle += 180
                    }
                }, label: {
                    HStack(alignment: .center) {
                        Text(self.isSignUp ? "Already have an account?" : "New here")
                            .foregroundStyle(.black)
                        Text(self.isSignUp ? "Login" : "Create an account")
                    }
                    .padding()
                })
                
//                SolidButton(
//                    selectedColor: self.isSignUp ? Color("deep-teal") : Color("tertiaryBackground"),
//                    buttonTitle: self.isSignUp ? "Get Started" : "Let's go",
//                    buttonAction: {
//                        generator.selectionChanged()
//                        self.authenticate()
//                    })
                //                .offset(y: 8)
                
//                GradientButton(title: isSignUp ? "Get Started" : "Let's go bitch", action: {
//                    generator.selectionChanged()
//                    self.authenticate()
//                })
                GradientButton(title: isSignUp ? "Get Started" : "Let's go bitch", action: {
                    generator.selectionChanged()
                    self.authenticate()
                }, bgColor: Color("tertiaryBackground"), agColor: [Color.red, Color.blue])
                Spacer()
            }
        }
        
        .opacity(self.isFade ? 1.0 : 0.0)
        .rotation3DEffect(
            Angle(degrees: rotationAngle),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .rotation3DEffect(
            Angle(degrees: rotationAngle),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .onAppear {
            userConfigManager.fetchUser()
            if userConfigManager.isSignIn() {
                DispatchQueue.main.async {
                    self.shouldNavigateToProfileView = true
                }
            }
        }
        .alert(isPresented: $authVM.isShowAlert) {
            Alert(title: Text(authVM.alertTitle), 
                  message: Text(authVM.alertMessage),
                  dismissButton: .cancel())
        }
        .fullScreenCover(isPresented: $shouldNavigateToProfileView) {
            MyProfileView()
        }
        
    }
    
    func authenticate() {
        if isSignUp {
            self.authVM.signUp(email: email, pwd: password, callback: {
                self.shouldNavigateToProfileView.toggle()
            })
        }else {
            self.authVM.signIn(email: email, pwd: password, callback: {
                self.shouldNavigateToProfileView.toggle()
            })
        }
    }
    
    func sendResetPasswordTokenToEmail() {}
}




#Preview {
    AuthenticationView()
        .environmentObject(UserConfigurationManager())
}
