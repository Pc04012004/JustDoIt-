//  ToDoListitemView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewmodel = ToDoListitemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time:.shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
            Button{
                viewmodel.toggleIsDone(item : item)
            }
        label:{
            Image(systemName:item.isDone ? "checkmark.seal.fill" : "circle" )
                .foregroundColor(.green)
                .padding(.trailing)
                .padding(.top)
        }
        }
    }
}

#Preview {
    ToDoListitemView(item: .init(id: "234", title: "get that stuff", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone:true, description: ""))
}

