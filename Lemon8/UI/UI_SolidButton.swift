//
//  LargeButton.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct SolidButton: View {
    var selectedColor: Color
    var buttonTitle: String
    var buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction, label: {
            Text(buttonTitle)
                .bold()
                .padding(EdgeInsets(top: 12, leading: 2, bottom: 12, trailing: 2))
                .foregroundColor(Color.white)
            
        })
        .frame(maxWidth: .infinity)
        
        .background(selectedColor)
        .cornerRadius(16.0)
        .shadow(color: selectedColor.opacity(0.2), radius: 5, x: 0, y: 2)
        .shadow(color: selectedColor.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 9, trailing: 16))        
    }
}

#Preview {
    SolidButton(selectedColor: Color("deep-teal"), buttonTitle: "Get Started", buttonAction: {})
}
