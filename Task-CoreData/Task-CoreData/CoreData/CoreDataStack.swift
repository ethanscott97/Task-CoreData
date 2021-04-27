//
//  CoreDataStack.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Task_CoreData")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading persistent stores \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {container.viewContext}
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                print("Error saving context \(error)")
            }
        }
    }
    
}//end of enum
