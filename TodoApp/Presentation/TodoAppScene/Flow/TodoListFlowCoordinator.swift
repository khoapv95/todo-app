//
//  TodoListFlowCoordinator.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit

protocol TodoListFlowCoordinatorDependencies  {
    func makeTodoListController(actions: TodoListViewModelActions) -> TodoListController
    func makeCallListController() -> CallListController
    func makeBuyListController() -> BuyListController
    func makeSellListController() -> SellListController
}

final class TodoListFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: TodoListFlowCoordinatorDependencies
    
    private weak var todoListController: TodoListController?
    
    init(navigationController: UINavigationController,
         dependencies: TodoListFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        // Note: here we keep strong reference with actions, this way this flow does not need to be strong referenced
        let actions = TodoListViewModelActions(showCallList: showCallList,
                                               showBuyList: showBuyList,
                                               showSellList: showSellList)
        let vc = dependencies.makeTodoListController(actions: actions)

        navigationController?.pushViewController(vc, animated: false)
        todoListController = vc
    }
    
    private func showCallList() {
        let vc = dependencies.makeCallListController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showBuyList() {
        let vc = dependencies.makeBuyListController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showSellList() {
        let vc = dependencies.makeSellListController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
