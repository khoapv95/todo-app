//
//  TodoAppSceneDIContainer.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit

final class TodoAppSceneDIContainer {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Todo List
    func makeTodoListController(actions: TodoListViewModelActions) -> TodoListController {
        return TodoListController.create(with: makeTodoListViewModel(actions: actions))
    }
    
    func makeTodoListViewModel(actions: TodoListViewModelActions) -> TodoListViewModel {
        return TodoListViewModelImpl(actions: actions)
    }
    
    // MARK: - Call List
    func makeCallListController() -> CallListController {
        return CallListController()
    }
    
    // MARK: - Flow Coordinators
    func makeTodoListFlowCoordinator(navigationController: UINavigationController) -> TodoListFlowCoordinator {
        return TodoListFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
}

extension TodoAppSceneDIContainer: TodoListFlowCoordinatorDependencies {}
