//
//  RegisterView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewViewModel()
    
    
    var body: some View {
        NavigationView {
            
            VStack { // Wrap content in a VStack
                // Header
                Form{}
                .frame(width: 10,height: 44)
                    
                
                HeaderView(title: "Register ", subtitle:"Get into it", background: . orange)
                    .frame(width:100 , height: 136)
                   
                    
                    
                    
                   
                
                // Login form
                Form {
                    TextField("Your Name", text: $viewmodel.Name)
                        .foregroundColor(.blue)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField("Your Email", text: $viewmodel.Email)
                        .foregroundColor(.blue)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Create Password", text: $viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TLButtonView(title: "Create Account", background: .pink) {
                        viewmodel.register()
                        
                    }
                    }
                }
                Spacer()
            }
        }
    }


#Preview {
    RegisterView()
}
