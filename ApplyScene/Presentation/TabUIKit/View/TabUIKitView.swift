//
//  TabUIKitView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/05.
//

import UIKit

class TabUIKitView: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.text = "TabUIKitView"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitleLabel()
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
