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
    var items: Observable<[BuyListItemViewModel]> { get }
    var loading: Observable<Bool> { get }
}

protocol BuyListViewModel: BuyListViewModelInput, BuyListViewModelOutput {}

final class BuyListViewModelImpl: BuyListViewModel {
    
    private let getBuyListUseCase: GetBuyListUseCase
    private var buyListLoadTask: Cancellable? { willSet { buyListLoadTask?.cancel() } }

    // MARK: - Initialization

    init(getBuyListUseCase: GetBuyListUseCase) {
        self.getBuyListUseCase = getBuyListUseCase
    }
    
    // MARK: - OUTPUT

    let items: Observable<[BuyListItemViewModel]> = Observable([])
    let loading: Observable<Bool> = Observable(false)
    
    private func loadBuyList() {
        loading.value = true
        buyListLoadTask = getBuyListUseCase.execute(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let items):
                strongSelf.items.value = items.map(BuyListItemViewModel.init)
            case .failure(let error):
                strongSelf.handle(error: error)
            }
            strongSelf.loading.value = false
        })
    }
    
    private func handle(error: Error) {
        print(error.localizedDescription)
    }
    
}

// MARK: - INPUT. View event methods

extension BuyListViewModelImpl {

    func viewDidLoad() {
        loadBuyList()
    }
}
