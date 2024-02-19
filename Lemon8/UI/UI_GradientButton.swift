//
//  GradientButton.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct GradientButton: View {
    @State private var angle: Double = 0.0
    var title: String
    var action: () -> Void
    
    var bgColor: Color
    var agColor: [Color]
    
    var body: some View {
        Button(action: action, label: {
            GeometryReader() { geometry in
                ZStack {
                    AngularGradient(
                        gradient: Gradient(colors: agColor),
                        center: .center,
                        angle: .degrees(angle)
                    )
                    .blendMode(.overlay)
                    .blur(radius: 8.0)
                    .mask(
                        RoundedRectangle(cornerRadius: 16.0)
                            .frame(height: 50)
                            .frame(maxWidth: geometry.size.width - 16)
                            .blur(radius: 8.0)
                            
                    )
                    .onAppear {
                        DispatchQueue.main.async {
                            withAnimation(.linear(duration: 7).repeatForever()){
                                self.angle += 350
                            }
                        }
                    }
                    
                    GradientText(title: title)
                        .frame(maxWidth: geometry.size.width - 16)
                        .frame(height: 50.0)
                        .background(bgColor)
                        .cornerRadius(16.0)
                        
                }
            }
            .frame(height: 50.0)
        })
    }
}

#Preview {
    GradientButton(title: "Get Started", action: {},
                   bgColor: Color("tertiaryBackground"),
                   agColor: [Color.red, Color.blue])
}
