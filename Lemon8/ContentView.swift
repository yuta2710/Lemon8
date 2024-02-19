//
//  ContentView.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .addNewPost
    
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

#Preview {
    ContentView()
        .environmentObject(UserConfigurationManager())
    
}
