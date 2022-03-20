//
//  CallListIItemViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

struct CallListItemViewModel: Equatable {
    let name: String
    let number: String
    
    init(person: Person) {
        self.name = "Name: \(person.name)"
        self.number = "Number: \(person.number)"
    }
}
