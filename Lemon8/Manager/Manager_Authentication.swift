//
//  Manager_Authentication.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 16/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreInternal
import Foundation

class UserConfigurationManager: ObservableObject {
    // Update User information
    // Get all users
    // Get user by ID
    // Fetch current sign in user (DONE)
    // Create User (DONE)
    // Sign In (DONE)
    // Sign Up (DONE)
    // Sign Out (DONE)
    // Delete Account
    
    @Published var isShowAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var currentUser: UserEntity? = nil
    
    func createUser(userInputData: [String: Any], callback: @escaping () -> ()) {
        let db = Firestore.firestore()
        do {
            try db.collection("users")
                .document(userInputData["id"] as! String)
                .setData(userInputData) { error in
                print("[SUCCESS - Create User]: User created with ID = \(String(describing: userInputData["id"]!))")
            }
            callback()
        }catch {
            print("Error adding document")
        }
    }
    
    func fetchUser(){
        // Check user ID exist or not
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(uId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            print("Data kia \(data)")
            
            DispatchQueue.main.async {
                self?.currentUser = UserEntity(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    username: data["username"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    biography: data["biography"] as? String ?? "",
                    gender: data["gender"] as? Gender ?? Gender.Male,
                    age: data["age"] as? Int ?? 18,
                    area: data["area"] as? String ?? "",
                    tiktok: data["tiktok"] as? String ?? "",
                    instagram: data["instagram"] as? String ?? "",
                    twitter: data["twitter"] as? String ?? "",
                    youtube: data["youtube"] as? String ?? "",
                    yourWebsite: data["yourWebsite"] as? String ?? "",
                    followers: data["followers"] as? [UserEntity] ?? [],
                    followings: data["followings"] as? [UserEntity] ?? [])
            }
        }
             
    }
    
    func signIn(email: String, pwd: String, callback: @escaping () -> ()) {
        Auth.auth().signIn(withEmail: email, password: pwd) { result, error in
            guard error == nil else {
                self.alertTitle = "Unable to sign in"
                self.alertMessage = error!.localizedDescription
                self.isShowAlert.toggle()
                
                return
            }
            print("[SUCCESS]: User sign in successfully")
            self.fetchUser()
            callback()
        }
        
       
    }
    
    func signUp(email: String, pwd: String, callback: @escaping () -> ()) {
        Auth.auth().createUser(withEmail: email, password: pwd) { result, error in
            guard error == nil else {
                self.alertTitle = "Unable to sign up"
                self.alertMessage = error!.localizedDescription
                self.isShowAlert.toggle()
                
                return
            }
            print("User sign in successfully")
            guard let userId = result?.user.uid else {
                return
            }
            
            let userData = UserEntity(id: userId, name: "", username: "", email: email, biography: "", gender: nil, age: 18, area: "", tiktok: "", instagram: "", twitter: "", youtube: "", yourWebsite: "", followers: [], followings: [])
            
            self.createUser(userInputData: userData.toDictionary(), callback: callback)
            
        }
    }
    
    func signOut(callback: @escaping () -> ()) {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            callback()
            
        }catch {
            self.alertTitle = "Huh"
            self.alertMessage = "Unable to sign out"
            self.isShowAlert.toggle()
        }
    }
    
    func deleteAccount() {}
    
    func isSignIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
}


// Call auth manager
// Call

//    @Published var currentUser: [String: Any] = [
//        "id": "",
//        "email": "",
//        "password": "",
//        "name": "",
//        "username": "",
//        "biography": "",
//        "gender": "\(Gender.Male)",
//        "age": 18,
//        "area": "",
//        "tiktok": "",
//        "instagram": "",
//        "twitter": "",
//        "youtube" : "",
//        "yourWebsite": "",
//        "followers": [],
//        "followings": [],
//        "isActive": true
//    ]

//            self.currentUser = [
//                "id": "",
//                "email": email,
//                "password": pwd,
//                "name": "",
//                "username": "",
//                "biography": "",
//                "gender": "\(Gender.Male)",
//                "age": 18,
//                "area": "",
//                "tiktok": "",
//                "instagram": "",
//                "twitter": "",
//                "youtube" : "",
//                "yourWebsite": "",
//                "followers": [],
//                "followings": [],
//                "isActive": true
//            ]
