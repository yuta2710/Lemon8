//
//  Lemon8App.swift
//  Lemon8
//
//  Created by Nguyen Phuc Loi on 11/02/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreInternal

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Lemon8App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    @StateObject var userAuthManager = UserConfigurationManager()
    
    var body: some Scene {
        WindowGroup {
            
//            if userAuthManager.isSignIn() && userAuthManager.currentUser != nil {
//                MyProfileView()
//            }else {}
            AuthenticationView()
                .environmentObject(userAuthManager)
        }
    }
}
