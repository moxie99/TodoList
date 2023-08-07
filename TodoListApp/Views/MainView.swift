//
//  ContentView.swift
//  TodoListApp
//
//  Created by Mac on 20/07/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewViewModel()
    
    var body: some View {
        
        if mainViewModel.isSignedIn && !mainViewModel.currentUserId.isEmpty {
//            signed in state
           accountView
        } else {
            LoginView()
        }
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: mainViewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
