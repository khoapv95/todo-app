//
//  ItemResponseDTO+Mapping.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

// MARK: - Data Transfer Object

struct ItemResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case quantity
        case type
    }
    let id: Int
    let name: String
    let price: Int
    let quantity: Int
    let type: Int
}

// MARK: - Mappings to Domain

extension ItemResponseDTO {
    func toDomain() -> Item {
        return .init(id: id, name: name, price: price, quantity: quantity, type: type)
    }
}
