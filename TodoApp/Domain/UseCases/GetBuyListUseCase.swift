//
//  GetBuyListUseCase.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol GetBuyListUseCase {
    func execute(completion: @escaping (Result<[Item], Error>) -> Void) -> Cancellable?
}

final class GetBuyListUseCaseImpl: GetBuyListUseCase {

    private let todoListRepository: TodoListRepository

    init(todoListRepository: TodoListRepository) {
        self.todoListRepository = todoListRepository
    }

    func execute(completion: @escaping (Result<[Item], Error>) -> Void) -> Cancellable? {
        return todoListRepository.fetchBuyList { result in
            completion(result)
        }
    }
}
