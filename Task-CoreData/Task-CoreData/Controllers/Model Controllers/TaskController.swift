//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import CoreData

class TaskController {
    
    static let sharedInstance = TaskController()
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        
        let task = Task(name: name, notes: notes ?? "", dueDate: dueDate ?? Date())
        tasks.append(task)
    
        CoreDataStack.saveContext()
    }
    
    func fetchTasks() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        
        self.tasks = tasks
    }
    
    func updateTask(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func toggleIsCompleted(task: Task) {
        task.isComplete.toggle()
        
        CoreDataStack.saveContext()
    }
    
    func deleteTask(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
            tasks.remove(at: index)
        
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
}//End of class
