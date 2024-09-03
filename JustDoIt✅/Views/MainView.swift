//
//  ContentView.swift
//  JustDoIt✅
//
//  Created by Prasad Chede on 20/06/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewmodel = MainViewViewModel()
    var body: some View {
        if viewmodel.isSignedIn, !viewmodel.currentUserId.isEmpty{
            accountView
        } else{
            LoginView()
        }
        }
    @ViewBuilder
    var accountView : some View{
        TabView{
            ToDoListView(userID: viewmodel.currentUserId)
                .tabItem {
                    Label("Home" , systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile" , systemImage: "person.circle")
                }
        }
    }
    }


#Preview {
    MainView()
}
