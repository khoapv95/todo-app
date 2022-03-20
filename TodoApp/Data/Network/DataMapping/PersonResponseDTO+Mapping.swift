//
//  PersonResponseDTO.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

// MARK: - Data Transfer Object

struct PersonResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case number
    }
    let id: Int
    let name: String
    let number: String
}

// MARK: - Mappings to Domain

extension PersonResponseDTO {
    func toDomain() -> Person {
        return .init(id: id, name: name, number: number)
    }
}
