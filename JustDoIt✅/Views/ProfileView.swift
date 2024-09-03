//
//  ProfileView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewmodel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewmodel.user{
                    profile(user: user)
                }
                    else{
                    Text("Loading Profile...")
                }
            }
                        
                        .navigationTitle("Profile")
                    }
        .onAppear{
            viewmodel.fetchUser()
        }
                }
            }
            @ViewBuilder
func profile(user: User) -> some View{
    
        
        //avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125 , height: 125)
            .padding(.bottom)
        //info
        VStack(alignment: .leading)
        {
            HStack{
                Text("    Name: ")
                    .bold()
                Text(user.name)
                    .padding()
            }
            HStack{
                Text("    Email: ")
                    .bold()
                Text(user.email)
                    .padding()
            }
            HStack{
                Text("    Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .padding()
            }
        }
        //signout
        
        TLButtonView(title: "Log out", background: .red, action: {
            //heybbg
            ProfileViewViewModel().logout()
        }).padding();
    }

        
    
    
    #Preview {
        ProfileView()
    }

