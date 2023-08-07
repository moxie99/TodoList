//
//  ProfileView.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    var body: some View {
        NavigationView {
           
                VStack {
                    if let user = viewModel.user {
                        profile(user: user)
                }
                    else {
                        Text("Profile Loading .....")
                            .foregroundColor(Color.teal)
                    }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    
    func profile(user: User) -> some View {
        //                Avatar
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.cyan)
                            .frame(width: 125, height: 125)
                            .padding()
        //                Info: Name, Email, Member since
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        
        Spacer()
        
        Button ("Log Out") {
            viewModel.logout()
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}