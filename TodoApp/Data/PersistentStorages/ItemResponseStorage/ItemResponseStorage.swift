//
//  ItemResponseStorage.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol ItemResponseStorage {
    func getResponse(completion: @escaping (Result<[ItemResponseDTO], CoreDataStorageError>) -> Void)
}
