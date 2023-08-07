import SwiftUI

struct FormView: View {
    let emailTitle: String
    let passwordTitle: String
    let isNameFieldVisible: Bool
    let nameTitle: String
    let buttonLabel: String
    let buttonBackgroundColor: Color
    let isLogin: Bool

    @StateObject var loginViewModel = LoginViewViewModel()
    @StateObject var registerViewModel = RegisterViewViewModel()
    
   

    var body: some View {
        
        let errorMessage = loginViewModel.errorMessage.isEmpty ? registerViewModel.errorMessage : loginViewModel.errorMessage

        
        
        Form {
            
            if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(Color.red)
                }
            if isNameFieldVisible {
                TextField(nameTitle, text: $registerViewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(.none)
                    .padding(.bottom, 10)
            }
            
            TextField(emailTitle, text: isLogin ? $loginViewModel.email : $registerViewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(.none)
                .padding(.bottom, 10)
            
            SecureField(passwordTitle, text: isLogin ? $loginViewModel.password : $registerViewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding(.bottom, 10)
            
            TLButton(title: buttonLabel, bgColor: buttonBackgroundColor) {
                isLogin ? loginViewModel.login() : registerViewModel.register()
            }
            .padding()
        }
        .offset(y: -50)
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(
            emailTitle: "Email Address",
            passwordTitle: "Password",
            isNameFieldVisible: true,
            nameTitle: "Full Name",
            buttonLabel: "Label",
            buttonBackgroundColor: .cyan,
            isLogin: false
        )
    }
}
