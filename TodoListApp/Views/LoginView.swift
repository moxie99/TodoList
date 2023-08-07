//
//  LoginView.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            
            VStack {
    //            Header
                HeaderView(title: "To do List",
                           subTitle: "Things to get done",
                           angle: 15,
                           bgColor: .cyan)
                
    //            Form
                FormView(emailTitle: "Email Address", passwordTitle: "Password", isNameFieldVisible: false,  nameTitle: "", buttonLabel: "Label", buttonBackgroundColor: .cyan, isLogin: true)
                
    //            New to todo list
                
                VStack {
                    Text("New to the app?")
                    NavigationLink("Create an account", destination: RegisterView()
                                   )
                }
                .padding(.bottom, 40)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
