//
//  CustomTextFieldStyle.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 13/02/2024.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {

    
    let placeholder: String
    let placeholderColor: Color
    let placeholderBgColor: Color
    
    var isEditing: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .font(.system(size: self.isEditing ? 14 : 16, design: .rounded))
                .foregroundColor(placeholderColor.opacity(0.5))
                .padding(.horizontal, self.isEditing ? 10 : 0)
                .background(placeholderBgColor)
                .offset(x: self.isEditing ? -8 : 0, y: self.isEditing ? -40 : 0)
                .scaleEffect(self.isEditing ? 0.9 : 1, anchor: .leading)
            
            
            configuration
                .padding(EdgeInsets(top: 6, leading: 2, bottom: 6, trailing: 0))
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(placeholderColor)
                
            
        }
        .animation(.easeOut, value: isEditing)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(self.isEditing ? placeholderColor : placeholderColor.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    AuthenticationView()
}
