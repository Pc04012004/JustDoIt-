// ToDoListViewViewModel.swift

import FirebaseFirestore
import Foundation

// ViewModel for single item
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var editingItem: ToDoListItem?  // Track the item being edited
    @Published var showingEditItemView = false // Show edit sheet
    
    private let userID: String
    init(userID: String) {
        self.userID = userID
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func updateItem(id: String, newTitle: String, newDescription: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .updateData([
                "title": newTitle,
                "description": newDescription
            ]) { error in
                if let error = error {
                    print("Error updating item: \(error)")
                } else {
                    print("Item successfully updated")
                }
            }
    }
}
