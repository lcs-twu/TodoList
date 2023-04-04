//
//  ListView.swift
//  TodoList
//
//  Created by Evelyn Chen on 2023-04-04.
//

import SwiftUI

struct ListView: View {
    @State var todoItems: [TodoItem] = existingTodoItems
    @State var newItemDescription: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    TextField("Enter a to-do item", text: $newItemDescription)
                    Button(action: {
                        let lastId = todoItems.last!.id
                        let newId = lastId + 1
                        let newTodoItem = TodoItem(id: newId, description: newItemDescription, completed: false)
                        todoItems.append(newTodoItem)
                        newItemDescription = ""
                    }, label: {
                        Text("ADD")
                            .font(.caption)
                    })
                }
                .padding(20)
                
                List(todoItems) { currentItem in
                    Label(title: {
                        Text(currentItem.description)
                    }, icon: {
                        if currentItem.completed == true {
                            Image(systemName: "checkmark.circle")
                        } else {
                            Image(systemName: "circle")
                        }
                    })
                    
                }
            }
            .navigationTitle("To do")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
