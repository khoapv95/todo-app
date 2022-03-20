//
//  BuyListController.swift
//  TodoApp
//
//  Created by Khoa Pham on 20/03/2022.
//

import UIKit

private let reuseIdentifier = "cellId"

class BuyListController: UITableViewController {
    
    // MARK: - Lifecycle
    
    private var viewModel: BuyListViewModel!
    
    static func create(with viewModel: BuyListViewModel) -> BuyListController {
        let view = BuyListController()
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
        navigationItem.title = "Buy List"

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    private func bind(to viewModel: BuyListViewModel) {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateUI() }
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
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
