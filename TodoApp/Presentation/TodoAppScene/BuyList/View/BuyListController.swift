//
//  BuyListController.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import UIKit

private let reuseIdentifier = "cellId"

class BuyListController: UITableViewController {
    
    // MARK: - Helpers
    
    func configureTableView() {
        view.backgroundColor = .white
        navigationItem.title = "Buy List"

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    private func updateUI() {
        tableView.reloadData()
    }
    
    private func updateLoading(_ loading: Bool) {
        if loading {
            LoadingView.show()
        } else {
            LoadingView.hide()
        }
    }
}

// MARK: - UITableViewDataSource

extension BuyListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}
