//
//  HomeViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/03/26.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        setupTableViewDelegate()
        registerCell()
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
        tableView.register(WebViewCell.self, forCellReuseIdentifier: WebViewCell.identifier)
    }
    
    private func addConstraintForTableView() {
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
        case .webView:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WebViewCell.identifier, for: indexPath) as? WebViewCell else {
                return UITableViewCell()
            }
            cell.configure()
            cell.setLabelText(text: WebViewCell.identifier)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch viewModel.cellTypes[indexPath.row] {
        case .swiftui:
            let controller = UIHostingController(rootView: rootView(completion: { [weak self] isHidden in
                self?.navigationController?.navigationBar.isHidden = isHidden
            }))
            self.navigationController?.pushViewController(controller, animated: true)
            self.navigationController?.navigationBar.isHidden = false
        case .webView:
            let controller = WebViewController()
            self.navigationController?.pushViewController(controller, animated: true)
            self.navigationController?.navigationBar.isHidden = false
        default:
            break
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let safeAreaTop = tableView.safeAreaInsets.top
        let safeAreaBottom = tableView.safeAreaInsets.bottom
        let safeAreaHeight = tableView.frame.height - safeAreaTop - safeAreaBottom
        let cellHeight = safeAreaHeight / viewModel.cellTypes.count.cgFloatValue
        return cellHeight
    }
}
