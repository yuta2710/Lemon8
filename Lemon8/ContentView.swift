//
//  ContentView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .profile
    
    init() {
        UITabBar.appearance().isHidden = true 
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                TabView(selection: $currentTab) {
                    NewfeedsView()
                        .tag(Tab.home)
                    
                    SearchView()
                        .tag(Tab.search)
                    
                    AddNewPostView()
                        .tag(Tab.addNewPost)
                    
                    NotificationsView()
                        .tag(Tab.notifications)
                    
                    MyProfileView()
                        .tag(Tab.profile)
                }
                TabBarModifier(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
            .mask(self)
    }
    
    public func multicolorGlow() -> some View {
            ZStack {
                ForEach(0..<2) { i in
                    Rectangle()
                        .fill(AngularGradient(gradient: Gradient(colors:
                                                                    Color.mockGradient1), center: .center))
                        .frame(width: 400, height: 300)
                        .mask(self.blur(radius: 20))
                        .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
                }
            }
        }
}

extension String {
    public func toDate(withFormat givenFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = givenFormat
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
        return dateFormatter.date(from: self)
    }
}

#Preview {
    ContentView()
        .environmentObject(UserConfigurationManager())
    
}
