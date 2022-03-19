//
//  AppDIContainer.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import Foundation

final class AppDIContainer {
    
    // MARK: - DIContainers of scenes
    func makeTodoAppSceneDIContainer() -> TodoAppSceneDIContainer {
        return TodoAppSceneDIContainer()
    }
}
