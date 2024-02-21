//
//  TextFieldIcon.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct TextFieldIcon: View {
    // rootBackgroundOfIcon, colorOfIcon, sizeOfIcon, weightOfIcon: Font.Weight
    @State private var rootBackgroundOfIcon: Color = Color("tertiaryBackground")
    @State private var gradientColorOfIcon: [Color] = [
        Color("pink-gradient-1"),
        Color("pink-gradient-2")
    ]
    @State private var sizeOfIcon: CGFloat = 17
    @State private var weightOfIcon: Font.Weight = .bold
    @State private var widthOfIconObject: CGFloat = 36
    @State private var heightOfIconObject: CGFloat = 36
    var gradientColorOfActiveState: [Color]? = Color.mockGradient1
    
    @Binding var onActive: Bool
    
    var body: some View {
        ZStack {
            
            VisualEffectBlur(blurStyle: .dark) {
                if onActive {
                    AngularGradient(
                        gradient: Gradient(
                            colors: gradientColorOfActiveState!),
                        center: .center, angle: .degrees(120)
                    )
                    
                    .mask(
                        Circle()
                            .frame(width: 70, height: 70, alignment: .center)
                            .blur(radius: 8.0)
                    )
                    .blur(radius: 5.0)
                 
                    
                }
                Color(rootBackgroundOfIcon)
                    .cornerRadius(12.0)
                    .opacity(0.8)
                    .blur(radius: 0.3)
            }
            .cornerRadius(12.0)
            .overlay (
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 1.0)
                        .blendMode(.overlay)
                    
                    Image(systemName: "key")
                        .gradientForeground(colors: gradientColorOfIcon)
                        .font(.system(size: sizeOfIcon, weight: weightOfIcon))
                        
                }
            )
            .frame(width: widthOfIconObject, height: heightOfIconObject, alignment: .center)
            .padding([.vertical, .leading], 8)
          
            
        }
    }
}

#Preview {
    TextFieldIcon(onActive: .constant(true))
}
