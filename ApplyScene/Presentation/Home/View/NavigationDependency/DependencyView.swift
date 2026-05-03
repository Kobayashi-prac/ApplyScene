//
//  DependencyView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/03.
//

import SwiftUI

struct DependencyView: View {
    
    let coordinator: Coordinator
    
    var body: some View {
        coordinator.destination()
    }
}

#Preview {
    DependencyView(coordinator: Coordinator())
}
