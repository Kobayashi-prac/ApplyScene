//
//  NavigationComponentCell.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/01.
//

import UIKit

class NavigationComponentCell: UITableViewCell {
    
    static let identifier = "NavigationComponent"
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure() {
        setupTitleLabel()
        setupTitleLabelText()
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
    
    private func setupTitleLabelText() {
        self.titleLabel.text = Self.identifier
    }
    
}
