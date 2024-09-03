//
//  ToDoListitemViewViewModel.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListitemViewViewModel:ObservableObject{
    
    init() {}
    func toggleIsDone(item : ToDoListItem){
        var ItemCopy = item
        ItemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(ItemCopy.id)
            .setData(ItemCopy.asDictionary())
    }
}
