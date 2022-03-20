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
    
    // MARK: - Persistent Storage
    lazy var persistentStorage: ItemResponseStorage = CoreDataItemResponseStorage()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - Use Cases
    func makeGetCallListUseCase() -> GetCallListUseCase {
        return GetCallListUseCaseImpl(todoListRepository: makeTodoListRepository())
    }
    
    func makeGetBuyListUseCase() -> GetBuyListUseCase {
        return GetBuyListUseCaseImpl(todoListRepository: makeTodoListRepository())
    }
    
    func makeSellListUseCase() -> GetSellListUseCase {
        return GetSellListUseCaseImpl(todoListRepository: makeTodoListRepository())
    }
    
    // MARK: - Repositories
    func makeTodoListRepository() -> TodoListRepository {
        return TodoListRepositoryImpl(dataTransferService: dependencies.apiDataTransferService,
                                      persistentStorage: persistentStorage)
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
        return CallListController.create(with: makeCallListViewModel())
    }
    
    func makeCallListViewModel() -> CallListViewModel {
        return CallListViewModelImpl(getCallListUseCase: makeGetCallListUseCase())
    }
    
    // MARK: - Buy List
    func makeBuyListController() -> BuyListController {
        return BuyListController.create(with: makeBuyListViewModel())
    }
    
    func makeBuyListViewModel() -> BuyListViewModel {
        return BuyListViewModelImpl(getBuyListUseCase: makeGetBuyListUseCase())
    }
    
    // MARK: - Sell List
    func makeSellListController() -> SellListController {
        return SellListController.create(with: makeSellListViewModel())
    }
    
    func makeSellListViewModel() -> SellListViewModel {
        return SellListViewModelImpl(getSellListUseCase: makeSellListUseCase())
    }
    
    // MARK: - Flow Coordinators
    func makeTodoListFlowCoordinator(navigationController: UINavigationController) -> TodoListFlowCoordinator {
        return TodoListFlowCoordinator(navigationController: navigationController,
                                           dependencies: self)
    }
}

extension TodoAppSceneDIContainer: TodoListFlowCoordinatorDependencies {}
