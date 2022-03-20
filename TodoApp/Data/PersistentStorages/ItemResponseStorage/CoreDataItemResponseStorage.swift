//
//  CoreDataItemResponseStorage.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation
import CoreData

final class CoreDataItemResponseStorage {

    private let coreDataStorage: CoreDataStorage

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Private

    private func fetchRequest() -> NSFetchRequest<ItemToSellEntity> {
        let request: NSFetchRequest = ItemToSellEntity.fetchRequest()
        return request
    }
    
}

extension CoreDataItemResponseStorage: ItemResponseStorage {
    func getResponse(completion: @escaping (Result<[ItemResponseDTO], CoreDataStorageError>) -> Void) {
        coreDataStorage.performBackgroundTask { context in
            do {
                let fetchRequest = self.fetchRequest()
                let requestEntities = try context.fetch(fetchRequest)
                
                completion(.success(requestEntities.map { $0.toDTO() } ))
            } catch {
                completion(.failure(CoreDataStorageError.readError(error)))
            }
        }
    }
}
