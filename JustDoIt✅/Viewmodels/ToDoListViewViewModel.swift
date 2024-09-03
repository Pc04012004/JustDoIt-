//
//  ToDoListViewViewModel.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseFirestore
import Foundation

//view model for singlw item
class ToDoListViewViewModel:ObservableObject{
    @Published var showingNewItemView = false
    
    private let userID: String
    init(userID : String) {
        self.userID = userID
    }
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID)
            .collection("todos")
            .document(id)
            .delete()
    }
}
