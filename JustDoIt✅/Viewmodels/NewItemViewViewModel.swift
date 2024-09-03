//
//  NewItemViewViewModel.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel:ObservableObject{
    @Published var title = ""
    @Published var duedate = Date()
    @Published var showAlert = false
   
    
    init() {}
    func save(){
        guard canSave else{
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title
                                   , dueDate:duedate.timeIntervalSince1970
                                   , createdDate: Date().timeIntervalSince1970
                                   , isDone: false)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave : Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard duedate >= Date().addingTimeInterval(-86400) else{
            return false
        }
    
        return true
    }
}

