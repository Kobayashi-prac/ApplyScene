//
//  DataBindingViewModel.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/21.
//

import Foundation

@available(iOS 17.0, *)
@Observable class DataBindingViewModel {
    
    var name = ""
    var score = 0
    
    init(playerName: String) {
        name = playerName
    }
    
    func update() {
        score += 1
    }
}
