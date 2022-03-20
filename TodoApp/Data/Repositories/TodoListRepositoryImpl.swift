//
//  TodoListRepositoryImpl.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

final class TodoListRepositoryImpl {

    private let dataTransferService: DataTransferService
    private let persistentStorage: ItemResponseStorage

    init(dataTransferService: DataTransferService,
         persistentStorage: ItemResponseStorage) {
        self.dataTransferService = dataTransferService
        self.persistentStorage = persistentStorage
    }
}

extension TodoListRepositoryImpl: TodoListRepository {

    func fetchCallList(completion: @escaping (Result<[Person], Error>) -> Void) -> Cancellable? {
        let endpoint = APIEndpoints.getCallList()
        let task = RepositoryTask()
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.map { $0.toDomain() }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
    
    func fetchBuyList(completion: @escaping (Result<[Item], Error>) -> Void) -> Cancellable? {
        let endpoint = APIEndpoints.getBuyList()
        let task = RepositoryTask()
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.map { $0.toDomain() }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task
    }
    
    func fetchSellList(completion: @escaping (Result<[Item], Error>) -> Void) {
        persistentStorage.getResponse { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.map { $0.toDomain() }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
