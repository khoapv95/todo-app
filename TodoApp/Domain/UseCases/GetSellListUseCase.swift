//
//  GetSellListUseCase.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol GetSellListUseCase {
    func execute(completion: @escaping (Result<[Item], Error>) -> Void)
}

final class GetSellListUseCaseImpl: GetSellListUseCase {

    private let todoListRepository: TodoListRepository

    init(todoListRepository: TodoListRepository) {
        self.todoListRepository = todoListRepository
    }

    func execute(completion: @escaping (Result<[Item], Error>) -> Void) {
        todoListRepository.fetchSellList(completion: completion)
    }
}
