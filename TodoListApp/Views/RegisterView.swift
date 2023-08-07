//
//  RegisterView.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        HeaderView(title: "Register",
                   subTitle: "Start Organizing things",
                   angle: -15,
                   bgColor: .teal)
        
        FormView(
                emailTitle: "Email Address",
                 passwordTitle: "Password",
                 isNameFieldVisible: true,
                 nameTitle: "Full Name",
                 buttonLabel: "Register",
                 buttonBackgroundColor: .teal,
                 isLogin: false)
        
        Spacer()
    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
