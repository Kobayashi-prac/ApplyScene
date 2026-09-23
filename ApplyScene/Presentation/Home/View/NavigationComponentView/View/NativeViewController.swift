//
//  NativeViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/09/22.
//

import UIKit

class NativeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        if #available(iOS 26.0, *) {
            setEdgeEffectStyle()
        } else {
            // Fallback on earlier versions
        }
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
    }
    
    private func addConstraintForTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    @available(iOS 26.0, *)
    private func setEdgeEffectStyle() {
        switch NavigationSettingStore.topEdgeEffectStyle {
        case .automatic:
            // ナビゲーションバー側
            tableView.topEdgeEffect.style = .automatic
            // タブバー・ツールバー側
            tableView.bottomEdgeEffect.style = .automatic
            // エフェクト自体を無効にする
            tableView.topEdgeEffect.isHidden = NavigationSettingStore.topEdgeEffectHidden
        case .hard:
            tableView.topEdgeEffect.style = .hard
            tableView.bottomEdgeEffect.style = .hard
            tableView.topEdgeEffect.isHidden = NavigationSettingStore.topEdgeEffectHidden
        case .soft:
            tableView.topEdgeEffect.style = .soft
            tableView.bottomEdgeEffect.style = .soft
            tableView.topEdgeEffect.isHidden = NavigationSettingStore.topEdgeEffectHidden
        }
    }
    
}

extension NativeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension NativeViewController: UITableViewDelegate {
}
