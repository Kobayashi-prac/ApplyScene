//
//  EnvironmentView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/21.
//

import SwiftUI

@available(iOS 17.0, *)
struct EnvironmentView: View {
    
    let data = EnvironmentData()
    
    var body: some View {
        Group {
            EnvContentView()
        }
        .environment(data)
    }
}

@available(iOS 17.0, *)
struct EnvContentView: View {
    
    @Environment(EnvironmentData.self) var data: EnvironmentData
    
    var body: some View {
        @Bindable var data = data
        SpeedView()
        Slider(value: $data.speed, in: 0...100)
    }
}

@available(iOS 17.0, *)
struct SpeedView: View {
    
    @Environment(EnvironmentData.self) var data: EnvironmentData
    
    var body: some View {
        Text("\(data.speed)")
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        EnvironmentView()
    } else {
    }
}
