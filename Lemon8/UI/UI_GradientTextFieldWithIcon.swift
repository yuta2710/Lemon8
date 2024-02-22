//
//  UI_GradientTextField.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 22/02/2024.
//

import SwiftUI

struct GradientTextFieldWithIcon: View {
    @Binding var isTextFieldBeingEdited: Bool
    @Binding var textFieldVal: String
    @Binding var isIconBeingBounce: Bool
    var iconName: String = "key"
    var placeholderTextField: String
    private let generator = UISelectionFeedbackGenerator()
    
    var body: some View {
        HStack (spacing: 12) {
            GradientIcon(nameOfIcon: iconName, onActive: $isTextFieldBeingEdited)
                .scaleEffect(isIconBeingBounce ? 1.2 : 1.0)
            TextField(placeholderTextField, text: $textFieldVal) { isEditing in
                generator.selectionChanged()
                isTextFieldBeingEdited = isEditing
                
                if isEditing {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)) {
                        self.isIconBeingBounce.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0.5)){
                            self.isIconBeingBounce.toggle()
                        }
                    }
                }
            }
            .colorScheme(.dark)
            .foregroundColor(.white.opacity(0.7))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12.0, style: .circular)
                .stroke(.white.opacity(0.3), lineWidth: 1)
        )
        .background(Color("tertiary-300"))
        .cornerRadius(12.0)
        .shadow(color: Color("tertiary-300"), radius: 10, x: 0.0, y: 1.0)
        .shadow(color: Color("shadowColor"), radius: 12, x: 1.0, y: 1.0)
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        
    }
}

#Preview {
    EditProfileView()
        .environmentObject(UserConfigurationManager())
}
