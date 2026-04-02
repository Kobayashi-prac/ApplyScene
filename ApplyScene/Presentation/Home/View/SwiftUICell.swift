//
//  SwiftUICell.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/01.
//

import UIKit

class SwiftUICell: UITableViewCell {
    
    static let identifier = "SwiftUI"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
