//
//  TodoListRepositoryImpl.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

final class TodoListRepositoryImpl {

    private let dataTransferService: DataTransferService

    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
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
}
