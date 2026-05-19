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
        VStack {
            SpeedView()
            Slider(value: $data.speed, in: 0...360, step: 0.1)
        }
    }
}

@available(iOS 17.0, *)
struct SpeedView: View {
    
    @Environment(EnvironmentData.self) var data: EnvironmentData
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        VStack {
            Text("🫨")
                .font(.largeTitle)
                .fontWeight(.medium)
                .rotationEffect(.degrees(data.speed))
                .animation(.easeInOut(duration: 5), value: data.speed)
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        EnvironmentView()
    } else {
    }
}
