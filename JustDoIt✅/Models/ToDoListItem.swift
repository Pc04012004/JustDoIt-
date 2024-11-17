import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    var description: String
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
