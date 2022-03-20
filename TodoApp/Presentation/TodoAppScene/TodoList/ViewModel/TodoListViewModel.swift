//
//  TodoListViewModel.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import Foundation

struct TodoListViewModelActions {
    let showCallList: () -> Void
    let showBuyList: () -> Void
    let showSellList: () -> Void
}

protocol TodoListViewModelInput {
    func viewDidLoad()
    func showCallList()
    func showBuyList()
    func showSellList()
}

protocol TodoListViewModelOutput {
    
}

protocol TodoListViewModel: TodoListViewModelInput, TodoListViewModelOutput {}

final class TodoListViewModelImpl: TodoListViewModel {
    
    private let actions: TodoListViewModelActions?
    
    // MARK: - Initialization

    init(actions: TodoListViewModelActions? = nil) {
        self.actions = actions
    }
    
}

// MARK: - INPUT. View event methods

extension TodoListViewModelImpl {

    func viewDidLoad() { }

    func showCallList() {
        actions?.showCallList()
    }
    
    func showBuyList() {
        actions?.showBuyList()
    }
    
    func showSellList() {
        
    }
}
