//
//  Manager_Image.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 16/02/2024.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreInternal
import FirebaseStorage
import SwiftUI

public class ImageManagementSystem: ObservableObject {
    let storage = Storage.storage()
    
    
    func upload(image: UIImage, root: String, fileName: String) {
        // Create a storage reference
        let storageRef = storage.reference().child("\(root)/\(fileName).jpg")

        // Convert the image into JPEG and compress the quality to reduce its size
        let data = image.jpegData(compressionQuality: 0.2)

        // Change the content type to jpg. If you don't, it'll be saved as application/octet-stream type
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"

        // Upload the image
        if let data = data {
            storageRef.putData(data, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error while uploading file: ", error)
                }

                if let metadata = metadata {
                    print("Metadata: ", metadata)
                }
            }
        }
    }
    
    func download() {
        
    }
}
