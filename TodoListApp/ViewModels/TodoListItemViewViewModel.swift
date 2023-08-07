//
//  TodoListItemViewViewModel.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//


import FirebaseAuth
import FirebaseFirestore
import Foundation


class TodoListItemViewViewModel: ObservableObject {
    
    init() {
        
    }
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
        
    }
}
