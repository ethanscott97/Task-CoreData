//
//  TaskDetailViewController.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

       updateView()
    }
    
    //MARK: - Properties
    var task: Task?
    var date: Date?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !notes.isEmpty else {return}
        
        if let task = task {
            task.name = name
            task.notes = notes
            task.dueDate = taskDueDatePicker.date
            TaskController.sharedInstance.updateTask(task: task, name: name, notes: notes, dueDate: date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDueDatePicker.date
    }
    
    //MARK: - Functions
    func updateView() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDueDatePicker.date = task.dueDate ?? Date()
    }

}
