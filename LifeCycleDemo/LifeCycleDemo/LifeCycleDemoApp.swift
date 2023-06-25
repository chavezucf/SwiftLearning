//
//  LifeCycleDemoApp.swift
//  LifeCycleDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

@main
struct LifecycleDemoApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
            .onChange(of: scenePhase, perform: {
                phase in switch phase {
                    case .active:
                        print("Active")
                    case .inactive:
                        print("Inactive")
                    case .background:
                        print("Background")
                    default:
                        print("Unknown scenephase")
                }
            })
        }
        
    }
}
