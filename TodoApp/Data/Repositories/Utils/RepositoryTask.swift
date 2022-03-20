//
//  RepositoryTask.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import Foundation

class RepositoryTask: Cancellable {
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}
