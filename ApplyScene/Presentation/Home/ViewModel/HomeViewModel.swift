//
//  HomeViewModel.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/01.
//

import Foundation

class HomeViewModel {
    
    enum CellType: CaseIterable {
        case uikit
        case swiftui
        case firebase
    }
    
    var cellTypes: [CellType] = CellType.allCases
    
}
