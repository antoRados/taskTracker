//
//  TaskController.swift
//  taskTracker
//
//  Created by Anto Rados on 12/13/21.
//

import Foundation

class TaskController {
    static let shared = TaskController()
    var tasks: [Task] = []
    
    // CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        saveToPersistentStorage()
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        saveToPersistentStorage()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        saveToPersistentStorage()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        saveToPersistentStorage()
    }
    
    
    
    // Persistence
    func persistentStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("myTasks.json")
        
        return fileURL
    }
    
    func saveToPersistentStorage() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: persistentStore())
        } catch {
            print(error)
            print(error.localizedDescription)
            print("Error saving to persistence location")
        }
    }
    
    func loadFromPersistentStorage() {
        do {
            let data = try Data(contentsOf: persistentStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
            print("Error loading from persistence location")
        }
    }
    
}
