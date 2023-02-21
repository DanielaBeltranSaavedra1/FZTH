//
//  AppApp.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import SwiftUI

@main
struct AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var landingViewModel = LandingViewModel()
    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
                .environmentObject(landingViewModel)
        }
    }
}
