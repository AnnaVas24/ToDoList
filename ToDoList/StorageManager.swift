//
//  StorageManager.swift
//  ToDoList
//
//  Created by Vasichko Anna on 16.05.2023.
//

import Foundation
import CoreData

// create a singleton for manage core data in SwiftUI progect
class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListModel")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
}



