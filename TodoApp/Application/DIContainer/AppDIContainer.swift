//
//  AppDIContainer.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import Foundation

final class AppDIContainer {
    
    lazy var appConfig = AppConfig()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = APIDataNetworkConfig(baseURL: URL(string: appConfig.apiBaseURL)!)
        
        let apiDataNetwork = NetworkServiceImpl(config: config)
        return DataTransferServiceImpl(with: apiDataNetwork)
    }()
    
    // MARK: - DIContainers of scenes
    func makeTodoAppSceneDIContainer() -> TodoAppSceneDIContainer {
        let dependencies = TodoAppSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
        return TodoAppSceneDIContainer(dependencies: dependencies)
    }
}
