//
//  TodoListRepository.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol TodoListRepository {
    func fetchCallList(completion: @escaping (Result<[Person], Error>) -> Void) -> Cancellable?
    func fetchBuyList(completion: @escaping (Result<[Item], Error>) -> Void) -> Cancellable?
    func fetchSellList(completion: @escaping (Result<[Item], Error>) -> Void)
}
