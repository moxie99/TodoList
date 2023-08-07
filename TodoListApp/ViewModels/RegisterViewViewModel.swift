//
//  RegisterViewViewModel.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class RegisterViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var name = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func isValidName(name: String) -> Bool {
        // Regular expression pattern for name validation
        let nameRegex = "^[A-Za-z\\s]{2,30}$"
        
        
        // NSPredicate to evaluate the name with the pattern
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        
        return namePredicate.evaluate(with: name)
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
    
    func register() {
        
        errorMessage = ""
        let isValid = isValidEmail(email: email)
        let isValidPassword = isValidPassword(password: password)
        let isValidNm = isValidName(name: name)
        
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty &&
                !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            
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
        
        guard isValidNm == true else {
            errorMessage = "Name format entered is not supported"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {
           [weak self] result, error in guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserInRecord(id: userID)
        }
        
        
    }
    
    private func insertUserInRecord (id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    
}
