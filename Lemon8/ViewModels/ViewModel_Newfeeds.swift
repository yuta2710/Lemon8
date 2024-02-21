//
//  NewfeedsViewViewModel.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 15/02/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreInternal
import FirebaseStorage

class NewfeedsViewModel: ObservableObject {
    @Published var posts: [PostEntity] = []
    let fbase = Firestore.firestore()
    
    init() {
        
    }
    
    func fetchPosts() async throws -> Void{
        let docRef = Firestore.firestore().collection("posts")
        let snapshot = try await docRef.getDocuments()

        for document in snapshot.documents {
            let post = try document.data(as: PostEntity.self)
//            for post in posts {
//                print("Post = \(post)")
//            }
            self.posts.append(post)
        }
    }
    
//    func fetchData() {
//        db.collection("books").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.books = documents.map { queryDocumentSnapshot -> Book in
//                let data = queryDocumentSnapshot.data()
//                let title = data["title"] as? String ?? ""
//                let author = data["author"] as? String ?? ""
//                let numberOfPages = data["pages"] as? Int ?? 0
//
//                return Book(id: .init(), title: title, author: author, numberOfPages: numberOfPages)
//            }
//        }
//    }
}


