//
//  CircleButton.swift
//  MovieBooking
//
//  Created by Willie Yam on 2022-08-16.
//

import SwiftUI

struct CircleWithGradientIconButton: View {
    @State var iconAsset: String = "plus"
    @State var iconGradientColor: [Color] = [Color("pink-gradient-1"), Color("pink-gradient-2")]
    @State private var borderGradientColor: [Color] = [Color("pink-gradient-1"), Color("pink-gradient-2")]
//    @Binding var isDisplayPhotoPicker: Bool
    @State var buttonAction: (() ->Void)?
    
    
    var body: some View {
        Button {
//            if isDisplayPhotoPicker {
//                self.isDisplayPhotoPicker.toggle()
//            }
            self.buttonAction?()
        } label: {
            Image(systemName: iconAsset)
                
                .frame(width: 120, height: 120)
                .background(Color("dark-tertiary"))
                .foregroundStyle(.linearGradient(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .top, endPoint: .bottom))
                .cornerRadius(100)
                .overlay(
                    Circle()
                        .trim(from: 0, to: CGFloat(0.5))
                        .stroke(LinearGradient(colors: borderGradientColor, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2))
                        .rotationEffect(.degrees(135))
                        .foregroundColor(.red)
                        .frame(width: 120, height: 120)
                )
        }
        
    }
}

#Preview {
//    AddNewPostView()
    CircleWithGradientIconButton()
}

