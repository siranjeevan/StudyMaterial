//
//  StudyMaterialApp.swift
//  StudyMaterial
//
//  Created by Jeevith  on 26/01/25.
//

import SwiftUI
import SwiftData

@main
struct StudyMaterialApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab1()
                Tab2()

                AllUsersView()
                    .tabItem {
                        Label("Database", systemImage: "tray.full")
                            .foregroundColor(.white)
                    }
            }

        }
        .modelContainer(for: User.self)
    }
}
