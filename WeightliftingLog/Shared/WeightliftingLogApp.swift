//
//  WeightliftingLogApp.swift
//  Shared
//
//  Created by miori Lee on 2022/07/05.
//

import SwiftUI

@main
struct WeightliftingLogApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
