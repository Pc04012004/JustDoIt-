//
//  ToDoListItem.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import Foundation
struct ToDoListItem:Codable,Identifiable{
    let id: String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    
    mutating func setDone(_ state : Bool){
        isDone = state
        
    }
}
