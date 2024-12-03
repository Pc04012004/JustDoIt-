// EditItemView.swift

import SwiftUI

struct EditItemView: View {
    @State private var title: String
    @State private var description: String
    @Binding var isPresented: Bool
    
    var onSave: (String, String) -> Void // Closure to handle save action
    
    init(item: ToDoListItem, isPresented: Binding<Bool>, onSave: @escaping (String, String) -> Void) {
        _title = State(initialValue: item.title)
        _description = State(initialValue: item.description)
        self._isPresented = isPresented
        self.onSave = onSave
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Edit Title")) {
                    TextField("Title", text: $title)
                }
                
                Section(header: Text("Edit Description")) {
                    TextField("Description", text: $description)
                }
            }
            .navigationTitle("Edit Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(title, description)
                        isPresented = false
                    }
                }
            }
        }
    }
}

