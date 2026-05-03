//
//  DependencyCell.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/03.
//

import UIKit

class DependencyCell: UITableViewCell {
    
    static let identifier = "Dependency"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure() {
        setupTitleLabel()
    }
    
    func setLabelText(text: String) {
        titleLabel.text = text
    }
    
    private func setupTitleLabel() {
        self.contentView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
