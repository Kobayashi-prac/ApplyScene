//
//  HomeViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/03/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: .zero)
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewDelegate()
        registerCell()
        view.addSubview(tableView)
        addConstraintForTableView()
    }
    
    private func setupTableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCell() {
        tableView.register(UIKitCell.self, forCellReuseIdentifier: "UIKit")
        tableView.register(SwiftUICell.self, forCellReuseIdentifier: "SwiftUI")
        tableView.register(FireBaseCell.self, forCellReuseIdentifier: "FireBase")
    }
    
    private func addConstraintForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch viewModel.cellTypes[indexPath.row] {
        case .uikit:
            cell = UITableViewCell()
        case .swiftui:
            cell = tableView.dequeueReusableCell(withIdentifier: "SwiftUI", for: indexPath)
        case .firebase:
            cell = UITableViewCell()
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = tableView.bounds.height / viewModel.cellTypes.count.CGFloatValue
        return cellHeight
    }
}
