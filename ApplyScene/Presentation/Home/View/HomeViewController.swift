//
//  HomeViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/03/26.
//

import UIKit

enum CellType: CaseIterable {
    case uikit
    case swiftui
    case firebase
}

class HomeViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: .zero)

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
        tableView.register(, forCellReuseIdentifier: "uikit")
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
        return CellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        for type in CellType.allCases {
            switch type {
            case .uikit:
                let cell = UITableViewCell()
            case .swiftui:
                let cell = UITableViewCell()
            case .firebase:
                let cell = UITableViewCell()
            }
        }
        return UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
