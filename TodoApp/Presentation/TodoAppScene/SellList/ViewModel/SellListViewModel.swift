//
//  SellListViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol SellListViewModelInput {
    func viewDidLoad()
}

protocol SellListViewModelOutput {
    var items: Observable<[BuyListItemViewModel]> { get }
}

protocol SellListViewModel: SellListViewModelInput, SellListViewModelOutput {}

final class SellListViewModelImpl: SellListViewModel {
    
    private let getSellListUseCase: GetSellListUseCase

    // MARK: - Initialization

    init(getSellListUseCase: GetSellListUseCase) {
        self.getSellListUseCase = getSellListUseCase
    }
    
    // MARK: - OUTPUT

    let items: Observable<[BuyListItemViewModel]> = Observable([])
    
    private func loadSellList() {
        getSellListUseCase.execute(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let items):
                strongSelf.items.value = items.map(BuyListItemViewModel.init)
            case .failure(let error):
                strongSelf.handle(error: error)
            }
        })
    }
    
    private func handle(error: Error) {
        print(error.localizedDescription)
    }
    
}

// MARK: - INPUT. View event methods

extension SellListViewModelImpl {

    func viewDidLoad() {
        loadSellList()
    }
}

