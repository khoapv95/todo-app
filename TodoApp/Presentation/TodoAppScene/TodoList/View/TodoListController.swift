//
//  TodoListController.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit

class TodoListController: UIViewController {
    
    // MARK: - Properties
        
    private lazy var callListButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Call List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTapCallList), for: .touchUpInside)
        return button
    }()
    
    private lazy var buyListButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Buy List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTapBuyList), for: .touchUpInside)
        return button
    }()
    
    private lazy var sellListButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Sell List", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTapSellList), for: .touchUpInside)
        return button
    }()
    
    private var viewModel: TodoListViewModel!
    
    // MARK: - Lifecycle
    
    static func create(with viewModel: TodoListViewModel) -> TodoListController {
        let view = TodoListController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Todo List"
        
        let stack = UIStackView(arrangedSubviews: [callListButton, buyListButton, sellListButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    // MARK: - Actions
    
    @objc func didTapCallList() {
        viewModel.showCallList()
    }
    
    @objc func didTapBuyList() {
        viewModel.showBuyList()
    }
    
    @objc func didTapSellList() {
        viewModel.showSellList()
    }
}
