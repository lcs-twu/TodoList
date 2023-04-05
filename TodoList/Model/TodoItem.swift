//
//  TodoItem.swift
//  TodoList
//
//  Created by Evelyn Chen on 2023-04-04.
//

import Foundation
import Blackbird

struct TodoItem: BlackbirdModel {
    @BlackbirdColumn var id: Int
    @BlackbirdColumn var description: String
    @BlackbirdColumn var emoji: String
}



