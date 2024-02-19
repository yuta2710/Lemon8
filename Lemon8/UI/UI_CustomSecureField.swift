////
////  CustomTextFieldStyle.swift
////  Lemon8
////
////  Created by Nguyen Phuc Loi on 13/02/2024.
////
//
//import SwiftUI
//
//struct CustomSecureFieldStyle: SecureFieldStyle {
//    let placeholder: String
//    let placeholderColor: Color
//    let placeholderBgColor: Color
//    
//    var isEditing: Bool
//    
//    func _body(configuration: TextField<_Label>) -> some View {
//        ZStack(alignment: .leading) {
//            Text(placeholder)
//                .font(.system(self.isEditing ? .title3 : .title2, design: .rounded))
//                .foregroundColor(placeholderColor.opacity(0.5))
//                .padding(.horizontal, self.isEditing ? 10 : 0)
//                .background(placeholderBgColor)
//                .offset(y: self.isEditing ? -28 : 0)
//                .scaleEffect(self.isEditing ? 0.9 : 1, anchor: .leading)
//            
//            configuration
//                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
//                .disableAutocorrection(true)
//                .autocapitalization(.none)
//                .font(.system(.title2, design: .rounded))
//                .foregroundColor(placeholderColor)
//                
//            
//        }
//        .animation(.easeOut, value: isEditing)
//        .padding(.horizontal, 16)
//        .padding(.vertical, 10)
//        .background(
//            RoundedRectangle(cornerRadius: 10.0)
//                .stroke(self.isEditing ? placeholderColor : placeholderColor.opacity(0.5), lineWidth: 1)
//        )
//    }
//}
