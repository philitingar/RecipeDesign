//
//  DataController.swift
//  RecipeDesign
//
//  Created by Timi on 3/11/22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "RecipeDesign")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to lead: \(error.localizedDescription)")
            }
        }
    }
}

