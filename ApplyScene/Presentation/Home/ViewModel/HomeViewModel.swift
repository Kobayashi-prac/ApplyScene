//
//  HomeViewModel.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/01.
//

class HomeViewModel {
    
    enum CellType: CaseIterable {
        case dependency
        case uikit
        case swiftui
        case firebase
        case webView
    }
    
    var cellTypes: [CellType] = CellType.allCases
    
}
