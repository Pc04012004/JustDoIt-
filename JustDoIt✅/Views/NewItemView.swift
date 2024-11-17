//
//  NewItemView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewmodel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text("New item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                DatePicker("Due Date", selection: $viewmodel.duedate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButtonView(title: "Save", background: .pink) {
                    if viewmodel.canSave{
                        viewmodel.save()
                        newItemPresented = false
                    }else{
                        viewmodel.showAlert = true
                    }
                }
                .padding()
            }
        }.alert(isPresented: $viewmodel.showAlert, content: {
            Alert(title: Text("Error") , message: Text("Please fill all fields and choose the due date i.e today or newer"))
        })
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        // code
    }))
}
