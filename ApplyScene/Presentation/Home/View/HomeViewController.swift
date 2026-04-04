//
//  HomeViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/03/26.
//

import UIKit
import SwiftUI

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
        tableView.register(SwiftUICell.self, forCellReuseIdentifier: SwiftUICell.identifier)
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
                
        switch viewModel.cellTypes[indexPath.row] {
        case .uikit:
            return UITableViewCell()
        case .swiftui:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwiftUICell.identifier, for: indexPath) as? SwiftUICell else {
                return UITableViewCell()
            }
            cell.configure()
            cell.setLabelText(text: SwiftUICell.identifier)
            return cell
        case .firebase:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch viewModel.cellTypes[indexPath.row] {
        case .swiftui:
            let controller = UIHostingController(rootView: rootView())
            self.navigationController?.pushViewController(controller, animated: true)
        default:
            break
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight = tableView.bounds.height / viewModel.cellTypes.count.cgFloatValue
        return cellHeight
    }
}
