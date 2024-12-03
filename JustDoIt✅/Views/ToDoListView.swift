// ToDoListView.swift

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewmodel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewmodel = StateObject(wrappedValue: ToDoListViewViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListitemView(item: item)
                        .swipeActions {
                            // Delete button
                            Button(action: {
                                viewmodel.delete(id: item.id)
                            }, label: {
                                Image(systemName: "trash.fill")
                                    .tint(.red)
                            })
                            
                            // Edit button
                            Button(action: {
                                viewmodel.editingItem = item // Set the item to be edited
                                viewmodel.showingEditItemView = true // Show edit view
                            }, label: {
                                Image(systemName: "pencil")
                                    .tint(.blue)
                            })
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Just do it buddy")
            .toolbar {
                Button(action: {
                    viewmodel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewmodel.showingNewItemView) {
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            }
            .sheet(isPresented: $viewmodel.showingEditItemView) {
                if let editingItem = viewmodel.editingItem {
                    EditItemView(
                        item: editingItem,
                        isPresented: $viewmodel.showingEditItemView,
                        onSave: { newTitle, newDescription in
                            viewmodel.updateItem(id: editingItem.id, newTitle: newTitle, newDescription: newDescription)
                        }
                    )
                }
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "0BqC8HnWAzgUIVPcVcQXxh9am112")
    }
}

