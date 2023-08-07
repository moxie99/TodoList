//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by Mac on 20/07/2023.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
