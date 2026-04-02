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
        // styleが何かと毎回呼ばれるか確認
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
    
    private func setupComponents() {
        self.contentView.backgroundColor = .lightGray
        self.contentView.addSubview(titleLabel)
    }
}
