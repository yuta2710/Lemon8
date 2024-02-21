//
//  PostEntity.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import Foundation
import SwiftUI

struct PostEntity: Codable {
    var id: String
    var heading: String
    var content: String
    var hashtags: [String]
    var photo: [String : String]
    var userId: String
    var createdAt: TimeInterval
    var updatedAt: TimeInterval
    
    enum CodingKeys: String, CodingKey {
        case id 
        case heading
        case content
        case hashtags
        case photo 
        case userId
        case createdAt
        case updatedAt
    }
    
//    init(id: String?, heading: String?, content: String?, hashtags: [String]?, photo: [String:String]?) {
//        self.id = id ?? ""
//        self.heading = heading ?? ""
//        self.content = content ?? ""
//        self.hashtags = hashtags ?? []
//        self.photo = photo ?? [:]
//    }
    
    init(id: String?, heading: String?, content: String?, hashtags: [String]?, photo: [String:String]?, userId: String?, createdAt: TimeInterval?, updatedAt: TimeInterval?) {
        self.id = id ?? ""
        self.heading = heading ?? ""
        self.content = content ?? ""
        self.hashtags = hashtags ?? []
        self.photo = photo ?? [:]
        self.userId = userId ?? ""
        self.createdAt = createdAt ?? Date().timeIntervalSince1970
        self.updatedAt = updatedAt ?? Date().timeIntervalSince1970
    }
}
