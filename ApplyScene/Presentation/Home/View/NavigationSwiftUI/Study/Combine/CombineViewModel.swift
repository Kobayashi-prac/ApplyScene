//
//  CombineViewModel.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import Foundation
import Combine

class CombineViewStore: ObservableObject {
    
    @Published var playerName = ""
    @Published var score = 0
    
    init(player: String) {
        playerName = player
        updateData()
    }
    
    func updateData() {
        score += 1
    }
}
