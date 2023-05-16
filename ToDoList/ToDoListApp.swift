//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Vasichko Anna on 16.05.2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    // get access to Storage manager
    let storageManager = StorageManager.shared
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // add core date view context to the environment
                .environment(\.managedObjectContext, storageManager.persistentContainer.viewContext)
        
        }
    }
}
