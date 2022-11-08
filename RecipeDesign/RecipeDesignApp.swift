//
//  RecipeDesignApp.swift
//  RecipeDesign
//
//  Created by Timi on 3/11/22.
//

import SwiftUI

@main
struct RecipeDesignApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
