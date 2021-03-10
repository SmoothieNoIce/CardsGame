//
//  CardsGameApp.swift
//  CardsGame
//
//  Created by User22 on 2021/3/10.
//

import SwiftUI

@main
struct CardsGameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
