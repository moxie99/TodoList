//
//  TodoListView.swift
//  TodoListApp
//
//  Created by Mac on 21/07/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To do List")
            .toolbar {
                Button {
                    
                    viewModel.showingNewItem = true
                } label: {
                     Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItem) {
                NewItemView(newItemPresented: $viewModel.showingNewItem)
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "37Jf5pOmGYfZ2lChw1B31WW4SN72")
    }
}
