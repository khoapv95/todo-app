//
//  ItemResponseEntity+Mapping.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation
import CoreData

extension ItemToSellEntity {
    func toDTO() -> ItemResponseDTO {
        return .init(id: Int(id),
                     name: name ?? "",
                     price: Int(price),
                     quantity: Int(quantity),
                     type: Int(type))
    }
}
