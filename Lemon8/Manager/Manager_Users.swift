//
//  Manager_Users.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 21/02/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreInternal

class UserManagerService: ObservableObject {
    @Published var memoizedUsers: [UserEntity] = []
    @Published var memoizedUser: UserEntity = UserEntity.init(
        id: "",
        name: "",
        username: "",
        email: "",
        biography: "",
        gender: Gender.Male,
        age: 18, area: "",
        tiktok: "",
        instagram: "",
        twitter: "", 
        youtube: "",
        yourWebsite: "",
        followers: [],
        followings: [],
        posts: [],
        avatar: "")
    
    let db = Firestore.firestore()
    
    func getUsers() -> Void {
        
    }
    
    func getUserById(from userId: String, completion: @escaping (UserEntity?, Error?) -> Void) {
        db.collection("users").document(userId).getDocument { [weak self] (document, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            if let document = document, document.exists {
                do {
                    var user = try? document.data(as: UserEntity.self)
                    completion(user, nil)
                }catch let error {
                    completion(nil, error)
                }
            }else {
                completion(nil, nil)
            }
        }
    }
}
