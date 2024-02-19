//
//  TabBarModifier.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct TabBarModifier: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            
            HStack(spacing: 0.0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    }, label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: 
                                        [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .leading,
                                    endPoint: .bottom))
                            .offset(y: currentTab == tab ? -17 : 0)
                        
                    })
                }
            }
            .frame(maxWidth: .infinity)
            .background(alignment: .leading) {
                Circle()
                    .fill(Color("tertiaryBackground"))
                    .frame(width: 80, height: 80)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 0)
                    .offset(x: bestOffset(width: width), y: -17)
                    .overlay (
                        Circle()
                            .trim(from: 0.0, to: CGFloat(0.4))
                            .stroke(LinearGradient(colors: [Color("pink-gradient-1"), Color("pink-gradient-2")], startPoint: .leading, endPoint: .trailing), lineWidth: CGFloat(2))
                            .rotationEffect(.degrees(110))
                            .offset(x: bestOffset(width: width), y: -17)
                    )
            }
        }
        .frame(height: 24)
        .padding(.top, 30)
        .background(LinearGradient(colors: [Color("purple"), Color("lightBlue"), Color("pink")], startPoint: .leading, endPoint: .trailing))
        
    }
    
    func bestOffset(width: CGFloat) -> CGFloat{
        let index = CGFloat(index())
        
        if index == 0 { return 0 }
        let buttonWidth = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidth
    }
    
    func index() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .search:
            return 1
        case .addNewPost:
            return 2
        case .notifications:
            return 3
        case .profile:
            return 4
        }
    }
}

#Preview {
//    TabBarModifier(currentTab: .constant(.home))
    ContentView()
        .environmentObject(UserConfigurationManager())
}
