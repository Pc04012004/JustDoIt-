//
//  ToDoListView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewmodel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
        self._items = FirestoreQuery(collectionPath:"users/\(userID)/todos" )
        
        self._viewmodel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListitemView(item: item)
                        .swipeActions{
                            Button(action: {
                                viewmodel.delete(id: item.id)
                            }, label: {
                                Image(systemName: "trash.fill")
                                    .tint(.red)
                                   
                            })
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Just do it buddy")
            .toolbar {
                Button(action: {
                    // action
                    viewmodel.showingNewItemView  = true
                }, label: {
                    Image(systemName: "plus")
                })
            }.sheet(isPresented: $viewmodel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "0BqC8HnWAzgUIVPcVcQXxh9am112")
    }
}
