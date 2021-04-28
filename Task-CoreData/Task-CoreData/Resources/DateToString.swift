//
//  DateToString.swift
//  Task-CoreData
//
//  Created by Ethan Scott on 4/28/21.
//

import Foundation

extension DateFormatter {
    
    static let dueDateTime: DateFormatter = {
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
}//end of extension

extension Date {
    
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        
        return formatter.string(from: self)
    }
}
