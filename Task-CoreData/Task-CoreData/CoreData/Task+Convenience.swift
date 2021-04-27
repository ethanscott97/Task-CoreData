//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import CoreData

extension Task {
    
    @discardableResult convenience init(name: String, notes: String = "", dueDate: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        
    }
}
