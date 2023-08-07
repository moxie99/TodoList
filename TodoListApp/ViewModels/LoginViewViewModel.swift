//
//  LoginViewViewModel.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//
import FirebaseAuth
import Foundation


class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func isValidEmail(email: String) -> Bool {
        // Regular expression pattern for email validation
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        // NSPredicate to evaluate the email with the pattern
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    func login(){
        errorMessage = ""
        let isValid = isValidEmail(email: email)
        let isValidPassword = isValidPassword(password: password)
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill all fields"
            return
        }
        
        guard isValid == true else {
            errorMessage = "Please enter a valid email"
            return
        }
        
        guard isValidPassword == true else {
            errorMessage = "Password must not be less than 8 characters, with at least one upper case, and a special symbol"
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    
}


