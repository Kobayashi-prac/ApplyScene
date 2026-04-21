//
//  WebViewCell.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/22.
//

import UIKit

class WebViewCell: UITableViewCell {
    
    static let identifier = "WebView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("セルの\(#function)が呼ばれた")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
