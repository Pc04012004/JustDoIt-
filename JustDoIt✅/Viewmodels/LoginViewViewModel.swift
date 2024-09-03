//
//  LoginViewViewModel.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel:ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errormessage: String = ""
    
    
        func login(){
            guard validate() else{
                return
            }
            //try log in
            Auth.auth().signIn(withEmail: email, password: password)
            
        }
        
       private func validate() -> Bool{
           errormessage = ""
           guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                 !password.trimmingCharacters(in: .whitespaces).isEmpty else{
               
               errormessage = "Please fill in all fields"
               return false
           }
           
           guard email.contains("@") && email.contains(".") else{
               errormessage = "Please enter valid email."
               return false
           }
           return true
        }
    }
    

