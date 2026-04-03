//
//  SwiftUICell.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/01.
//

import UIKit

class SwiftUICell: UITableViewCell {
    
    static let identifier = "SwiftUI"
    
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
        self.contentView.addSubview(titleLabel)
        setupConstraints()
        addTapGesture()
    }
    
    func setLabelText(text: String) {
        titleLabel.text = text
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func addTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.contentView.addGestureRecognizer(gesture)
    }
    
    @objc private func didTap() {
    }
}
