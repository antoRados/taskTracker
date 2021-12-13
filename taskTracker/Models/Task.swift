//
//  Task.swift
//  taskTracker
//
//  Created by Anto Rados on 12/13/21.
//

import UIKit

class Task: Codable {
    var name: String
    var notes: String?
    var dueDate: Date?
    var isComplete: Bool
    
    init(name: String, notes: String?, dueDate: Date?, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    
    } //End of initializer
} //End of "Task" class


extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.name == rhs.name && lhs.notes == rhs.notes && lhs.dueDate == rhs.dueDate && lhs.isComplete == rhs.isComplete
    }
} //End Equatable
