//
//  ContentView.swift
//  ToDoList
//
//  Created by Vasichko Anna on 16.05.2023.
//

import SwiftUI

struct ContentView: View {
    // add property for textfield
    @State var taskName: String = ""
    // add environment object for view context
    @Environment(\.managedObjectContext) var viewContext
    // add fetch request to get all tasks from core data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Task.title, ascending: true)]) var tasks: FetchedResults<Task>
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
              // create a textfield with rounded border to enter task name and a button with blue background to save the task
                    TextField("Enter task name", text: $taskName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: saveTask) {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                   
             // create a list to show task list
                List {
                    ForEach(tasks) { task in
                        Text(task.title ?? "")
                    }
                    // add delete function to list
                        .onDelete(perform: deleteTask)
                }
        
            }
            .padding()
            .navigationTitle("To Do List")
        }
        
    
    }
    
    // create a function to save the new task to view context
    private func saveTask() {
        let newTask = Task(context: viewContext)
        newTask.title = taskName
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // create a function to delete task from view context
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            viewContext.delete(task)
        }
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }


}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


