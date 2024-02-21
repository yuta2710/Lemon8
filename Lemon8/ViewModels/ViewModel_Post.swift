//
//  ViewModel_Post.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 19/02/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreInternal
import FirebaseStorage
import SwiftUI
import PhotosUI

class PostViewViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    @Published var photosPickerItem: [PhotosPickerItem] = [] {
        didSet {
            setImages(from: photosPickerItem)
        }
    }
//    @EnvironmentObject var authVM: UserConfigurationManager
//    
    let fbase = Firestore.firestore()
    
    
    func uploadNewPost(heading: String, content: String, hashtags: [String]) {
        loadImageToStorage { [weak self] (rootPostId, dictUrls) in
            guard let self = self else { return }
            guard let uId = Auth.auth().currentUser?.uid else {
                return
            }
            
            print("Dick urls = \(dictUrls)")
            //            let listUrl: [String: String] = (dictUrls.1 as? [String:String])!
            
            let postJson = PostEntity(
                id: rootPostId,
                heading: heading,
                content: content,
                hashtags: hashtags,
                photo: dictUrls,
                userId: uId,
                createdAt: Date().timeIntervalSince1970,
                updatedAt: Date().timeIntervalSince1970)
            
            fbase.collection("users").document(uId).getDocument { [weak self] (document, error) in
                if let document = document, document.exists {
                    var user = try? document.data(as: UserEntity.self)
                    
                    user?.posts.insert(postJson, at: 0)
                    
                    if let user = user {
                        do{
                            try self!.fbase.collection("users").document(uId).setData(user.toDictionary())
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            
            fbase.collection("posts").document(rootPostId).setData(postJson.toDictionary())
            
        }
    }
    
    func addImageToContainer(image: UIImage) -> Void {
        images.append(image)
    }
    
    func setImages(from selections: [PhotosPickerItem]) {
        Task {
            var imagesArr: [UIImage] = []
            for selection in selections {
                if let data = try? await selection.loadTransferable(type: Data.self) {
                    if let image = UIImage(data: data) {
                        imagesArr.insert(image, at: 0)
                    }
                }
            }
            
            self.images = imagesArr
        }
    }
    
    func loadImageToStorage(completion: @escaping ((String, [String: String])) -> Void) {
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let rootPostId = UUID().uuidString
        var dictUrls: [String: String] = [:]
        let uploadGroup = DispatchGroup()
        
        for (index, image) in self.images.enumerated() {
            uploadGroup.enter()
            
            let childPostId = UUID().uuidString
            let ref = Storage.storage().reference().child("posts/\(uId)/\(rootPostId)/\(childPostId)_\(index + 1).jpeg")
            
            guard let imgData = image.jpegData(compressionQuality: 0.5) else {
                uploadGroup.leave()
                continue
            }
            
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            
            ref.putData(imgData, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    uploadGroup.leave()
                } else {
                    ref.downloadURL { (url, error) in
                        if let imgUrlString = url?.absoluteString {
                            print("\(childPostId): \(imgUrlString)")
                            dictUrls[childPostId] = imgUrlString
                        }
                        uploadGroup.leave()
                    }
                }
            }
        }
        
        uploadGroup.notify(queue: .main) {
            completion((rootPostId, dictUrls))
        }
    }
}

