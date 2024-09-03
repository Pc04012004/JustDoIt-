//
//  RegisterViewViewModel.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var Name: String = ""
    @Published var Email: String = ""
    @Published var password: String = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: Email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func validate() -> Bool{
        guard !Name.trimmingCharacters(in: .whitespaces).isEmpty,
              !Email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard Email.contains("@") && Email.contains(".") else {
            return false
        }
        guard password.count >= 8 else {
            return false
        }
        return true
    }
    
    private func insertUserRecord(id: String) {
        // Implement the method to insert user record into your database
        let newUser = User(id: id, name: Name, email: Email, joined:Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
}
