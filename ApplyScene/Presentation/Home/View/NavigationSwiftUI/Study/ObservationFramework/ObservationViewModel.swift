//
//  ObservationViewModel.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import Foundation

@available(iOS 17.0, *)
@Observable class ObservationViewModel {
    
    var playerName = ""
    var score = 0
    
    init(name: String) {
        self.playerName = name
    }
    
    func update() {
        score += 1
    }
    
}
