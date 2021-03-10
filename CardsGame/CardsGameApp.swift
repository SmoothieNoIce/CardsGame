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
            InGameView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct CardsGameApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
