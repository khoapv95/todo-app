//
//  GetCallListUseCase.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol GetCallListUseCase {
    func execute(completion: @escaping (Result<[Person], Error>) -> Void) -> Cancellable?
}

final class GetCallListUseCaseImpl: GetCallListUseCase {

    private let todoListRepository: TodoListRepository

    init(todoListRepository: TodoListRepository) {

        self.todoListRepository = todoListRepository
    }

    func execute(completion: @escaping (Result<[Person], Error>) -> Void) -> Cancellable? {
        return todoListRepository.fetchCallList { result in
            completion(result)
        }
    }
}
