//
//  BuyListViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol BuyListViewModelInput {
    func viewDidLoad()
}

protocol BuyListViewModelOutput {
//    var items: Observable<[CallListItemViewModel]> { get }
//    var loading: Observable<Bool> { get }
}

protocol BuyListViewModel: BuyListViewModelInput, BuyListViewModelOutput {}

final class BuyListViewModelImpl: BuyListViewModel {
    
}

// MARK: - INPUT. View event methods

extension BuyListViewModelImpl {

    func viewDidLoad() {
    }
}
