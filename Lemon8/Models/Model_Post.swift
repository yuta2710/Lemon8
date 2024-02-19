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
    var photo: String
    
    enum CodingKeys: String, CodingKey {
        case id 
        case heading
        case content
        case hashtags
        case photo 
    }
    
    init(id: String?, heading: String?, content: String?, hashtags: [String]?, photo: String?) {
        self.id = id ?? ""
        self.heading = heading ?? ""
        self.content = content ?? ""
        self.hashtags = hashtags ?? []
        self.photo = photo ?? "placeholder_image"
    }
}
