//
//  CallListViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

protocol CallListViewModelInput {
    func viewDidLoad()
}

protocol CallListViewModelOutput {
    var items: Observable<[CallListItemViewModel]> { get }
    var loading: Observable<Bool> { get }
}

protocol CallListViewModel: CallListViewModelInput, CallListViewModelOutput {}

final class CallListViewModelImpl: CallListViewModel {
    
    private let getCallListUseCase: GetCallListUseCase
    private var callListLoadTask: Cancellable? { willSet { callListLoadTask?.cancel() } }

    // MARK: - Initialization

    init(getCallListUseCase: GetCallListUseCase) {
        self.getCallListUseCase = getCallListUseCase
    }
    
    // MARK: - OUTPUT

    let items: Observable<[CallListItemViewModel]> = Observable([])
    let loading: Observable<Bool> = Observable(false)

    private func loadCallList() {
        loading.value = true
        callListLoadTask = getCallListUseCase.execute(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let persons):
                strongSelf.items.value = persons.map(CallListItemViewModel.init)
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

extension CallListViewModelImpl {

    func viewDidLoad() {
        loadCallList()
    }
}
