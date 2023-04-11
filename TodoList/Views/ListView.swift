//
//  ListView.swift
//  TodoList
//
//  Created by Evelyn Chen on 2023-04-04.
//
import Blackbird
import SwiftUI

struct ListView: View {
    @Environment(\.blackbirdDatabase) var db: Blackbird.Database?
    
    @State var newItemDescription: String = ""
    
    @State var searchText = ""
    var body: some View {
        NavigationView{
            VStack {
                
                ListItemsView(filteredOn: searchText)
                .searchable(text: $searchText)
                
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    Button(action: {
                        //                        let lastId = todoItems.last!.id
                        //                        let newId = lastId + 1
                        //                        let newTodoItem = TodoItem(id: newId, description: newItemDescription, completed: false)
                        //                        todoItems.append(newTodoItem)
                        //                        newItemDescription = ""
                        Task { try await db!.transaction {
                            core in try core.query("INSERT INTO TodoItem (description) VALUES (?)", newItemDescription)
                        }
                            newItemDescription = ""
                        }
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                .padding(20)
            }
            .navigationTitle("To do")
        }
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
