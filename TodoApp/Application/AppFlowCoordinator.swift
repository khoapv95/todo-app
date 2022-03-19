//
//  AppFlowCoordinator.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        // In App Flow we can check if user needs to login, if yes we would run login flow
        let todoAppSceneDIContainer = appDIContainer.makeTodoAppSceneDIContainer()
        let flow = todoAppSceneDIContainer.makeTodoListFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}
