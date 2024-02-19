//
//  Manager_Colors.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 19/02/2024.
//

import Foundation
import SwiftUI

struct ColorOptional {
    enum ValueIdentifier {
        case solid(Color)
        case gradient([Color])
    }
    
    var value: ValueIdentifier
}
