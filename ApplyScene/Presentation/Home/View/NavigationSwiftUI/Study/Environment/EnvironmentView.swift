//
//  EnvironmentView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/21.
//

import SwiftUI

@available(iOS 17.0, *)
struct EnvironmentView: View {
    
    @Environment(EnvironmentModel.self) var model: EnvironmentModel
    
    var body: some View {
        @Bindable var model = model
        Slider(value: $model.speed, in: 0...100)
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        EnvironmentView()
    } else {
        // Fallback on earlier versions
    }
}
