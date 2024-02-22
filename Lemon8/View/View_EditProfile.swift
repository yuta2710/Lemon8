//
//  View_EditProfile.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 22/02/2024.
//

import SwiftUI


struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isTextFieldBeingEdited: Bool = false
    @State private var textFieldVal: String = ""
    @State private var isIconBeingBounce: Bool = false
    @State private var editNavigationSchema: [String : [String : String]] = [:]
    
    // name, username, biography, tiktok, instagram , twitter, youtube, yourWebsite
    @State private var name: String = ""
    @State private var username: String = ""
    @State private var biography: String = ""
    @State private var tiktok: String = ""
    @State private var instagram: String = ""
    @State private var twitter: String = ""
    @State private var youtube: String = ""
    @State private var yourWebsite: String = ""
    
    @State private var isIconOfNameBeingBounced: Bool = false
    @State private var isIconOfUsernameBeingBounced: Bool = false
    @State private var isIconOfBiographyBeingBounced: Bool = false
    @State private var isIconOfTiktokBeingBounced: Bool = false
    @State private var isIconOfInstagramBeingBounced: Bool = false
    @State private var isIconOfTwitterBeingBounced: Bool = false
    @State private var isIconOfYoutubeBeingBounced: Bool = false
    @State private var isIconOfYourWebsiteBeingBounced: Bool = false
    
    @State private var isEditingNameTextField: Bool = false
    @State private var isEditingUsernameTextField: Bool = false
    @State private var isEditingBiographyTextField: Bool = false
    @State private var isEditingTiktokTextField: Bool = false
    @State private var isEditingInstagramTextField: Bool = false
    @State private var isEditingTwitterTextField: Bool = false
    @State private var isEditingYoutubeTextField: Bool = false
    @State private var isEditingYourWebsiteTextField: Bool = false
    
    var account: UserEntity?
    
    var body: some View {
        NavigationView {
            ZStack {
            
                LinearGradient(gradient:
                                Gradient(
                                    colors: [Color("tertiaryBackground")]),
                               startPoint: .leading,
                               endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
                
                
                    
                VStack (spacing: 14.0) {
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingNameTextField, textFieldVal: self.$name, isIconBeingBounce: self.$isIconOfNameBeingBounced, iconName: "person.text.rectangle", placeholderTextField: "Name")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingUsernameTextField, textFieldVal: self.$username, isIconBeingBounce: self.$isIconOfUsernameBeingBounced, iconName: "person", placeholderTextField: "Username")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingBiographyTextField, textFieldVal: self.$biography, isIconBeingBounce: self.$isIconOfBiographyBeingBounced, iconName: "book.pages", placeholderTextField: "Biography")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingTiktokTextField, textFieldVal: self.$tiktok, isIconBeingBounce: self.$isIconOfTiktokBeingBounced, iconName: "link", placeholderTextField: "Tiktok")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingInstagramTextField, textFieldVal: self.$instagram, isIconBeingBounce: self.$isIconOfInstagramBeingBounced, iconName: "link", placeholderTextField: "Instagram")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingTwitterTextField, textFieldVal: self.$twitter, isIconBeingBounce: self.$isIconOfTwitterBeingBounced, iconName: "link", placeholderTextField: "Twitter")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingYoutubeTextField, textFieldVal: self.$youtube, isIconBeingBounce: self.$isIconOfYoutubeBeingBounced, iconName: "link", placeholderTextField: "Youtube")
                    
                    GradientTextFieldWithIcon(isTextFieldBeingEdited: self.$isEditingYourWebsiteTextField, textFieldVal: self.$yourWebsite, isIconBeingBounce: self.$isIconOfYourWebsiteBeingBounced, iconName: "link", placeholderTextField: "Your Website")
                
                    GradientButton(title: "Update My Profile", action: {
                        
                    }, bgColor: Color("tertiaryBackground"), agColor: [Color("pink-gradient-1"), Color("pink-gradient-2")])
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .onAppear {
                Task {
                    do {
                        if let account = account {
                            self.name = account.name
                            self.username = account.username
                            self.biography = account.biography
                            self.tiktok = account.tiktok
                            self.instagram = account.instagram
                            self.twitter = account.twitter
                            self.youtube = account.youtube
                            self.yourWebsite = account.yourWebsite
                        }
                    }catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        HStack {
                            GradientIcon(nameOfIcon: "chevron.backward", onActive: .constant(false))
                            Spacer()
                            GradientText(title: "Update Your Profile")
                                .foregroundColor(.white)
//                                .font(.largeTitle)
                                .bold()
//                                .offset(y: 36)
                            
                        }
                        GradientText(title: "Coding")
                            .foregroundColor(.white)
//                                .font(.largeTitle)
                            .bold()
//                                .offset(y: 36)
                    })
                    
                        
                }
            }
        }
    }
}

#Preview {
//    MyProfileView()
    EditProfileView()
        .environmentObject(UserConfigurationManager())
}


//                Button(action: {}, label: {
//                    HStack {
//                        Text("Name")
//                        Spacer()
//
//                        Text("Yuta Okkotsu")
//                        Spacer()
//
//                        Image(systemName: "chevron.forward")
//                    }
//                    .padding(EdgeInsets(top: 12, leading: 36, bottom: 12, trailing: 36))
//                    .background(.white)
//                    .cornerRadius(12.0)
//
//                })
