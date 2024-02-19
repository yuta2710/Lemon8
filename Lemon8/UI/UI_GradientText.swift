//
//  GradientText.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 12/02/2024.
//

import SwiftUI

struct GradientText: View {
    var title: String
    var body: some View {
        Text(title)
            .gradientText(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")])
            
    }
}

extension View {
    public func gradientText(colors: [Color]) -> some View {
        self
            .overlay(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

#Preview {
    GradientText(title: "Gradient Text")
}
