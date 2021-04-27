//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import UIKit

protocol TaskCompletionDelegate: AnyObject {
    func TaskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?
    var task: Task? {
        didSet {
            updateViews()
        }
    }

    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        if let delegate = delegate {
            delegate.TaskCellButtonTapped(self)
        }
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else {return}
        taskNameLabel.text = task.name
        
        if task.isComplete {
            completionButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            completionButton.setBackgroundImage(UIImage(systemName: "square"), for: .normal)
        }
    }
}
