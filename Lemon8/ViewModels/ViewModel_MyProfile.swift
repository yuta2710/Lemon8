//
//  ProfileViewViewModel.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 15/02/2024.
//
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreInternal
import Foundation

class MyProfileViewModel: ObservableObject {
    @Published var me: UserEntity? = nil
    
    init() {}
    
    func getMe() {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
//        db.collection("users").document(currentUserId).getDocument { snapshot, error
//            
//        }
    }
}
