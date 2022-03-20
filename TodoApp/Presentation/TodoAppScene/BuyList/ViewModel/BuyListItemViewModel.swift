//
//  BuyListItemViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

struct BuyListItemViewModel: Equatable {
    let name: String
    let price: String
    let quantity: String
    
    init(item: Item) {
        self.name = "Name: \(item.name)"
        self.price = "Price: \(item.price)"
        self.quantity = "Quantity: \(item.quantity)"
    }
}
