//
//  CallListController.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit

private let reuseIdentifier = "cellId"

class CallListController: UITableViewController {
    
    // MARK: - Lifecycle
    
    private var viewModel: CallListViewModel!
    
    static func create(with viewModel: CallListViewModel) -> CallListController {
        let view = CallListController()
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
        navigationItem.title = "Call List"

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
    }
    
    private func bind(to viewModel: CallListViewModel) {
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

extension CallListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) 
        cell.textLabel?.text = viewModel.items.value[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.items.value[indexPath.row].number
        return cell
    }
}

class CustomTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
