//
//  TaslListTableViewController.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/27/21.
//

import UIKit

class TaskListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TaskController.sharedInstance.fetchTasks()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasks.count
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else {return UITableViewCell()}

        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.delegate = self
        cell.task = task

        return cell
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //IIDOO
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? TaskDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = task
        }
    }
}

extension TaskListTableViewController: TaskCompletionDelegate {
    func TaskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else {return}
        TaskController.sharedInstance.toggleIsCompleted(task: task)
        sender.updateViews()
    }
    
    
}