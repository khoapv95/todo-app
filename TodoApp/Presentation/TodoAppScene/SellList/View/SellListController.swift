//
//  SellListController.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import UIKit

private let reuseIdentifier = "cellId"

class SellListController: UITableViewController {
    
    // MARK: - Lifecycle
    
    private var viewModel: SellListViewModel!
    
    static func create(with viewModel: SellListViewModel) -> SellListController {
        let view = SellListController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        view.backgroundColor = .white
        navigationItem.title = "Sell List"

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    private func bind(to viewModel: SellListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateUI() }
    }
    
    private func updateUI() {
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension SellListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.items.value[indexPath.row].name
        let detailText = "\(viewModel.items.value[indexPath.row].price)\n\(viewModel.items.value[indexPath.row].quantity)"
        cell.detailTextLabel?.text = detailText
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}
