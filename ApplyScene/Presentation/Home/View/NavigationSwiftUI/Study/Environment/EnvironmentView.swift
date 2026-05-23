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
        
    var body: some View {
        VStack {
            SpeedView()
        }
    }
}

@available(iOS 17.0, *)
struct SpeedView: View {
    
    @Environment(EnvironmentData.self) var data: EnvironmentData
    @State private var text: String = "Welcome to SwiftUI"
    
    @State var index = 0
    
    var colorNames: [String] = ["red", "blue", "green", "yellow"]
    var colors: [Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        @Bindable var data = data
        VStack {
            Spacer()
            
            Text(text)
                .font(.largeTitle)
                .fontWeight(.medium)
                .rotationEffect(.degrees(data.speed))
                .animation(.easeInOut(duration: 5), value: data.speed)
                .foregroundStyle(colors[index])
            
            Spacer()
            Divider()
            
            Slider(value: $data.speed, in: 0...360, step: 0.1)
                .padding()
            
            TextField("Enter text here", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Picker(selection: $index, label: Text("Color")) {
                ForEach(0 ..< colorNames.count, id: \.self) {
                    Text(colorNames[$0])
                        .foregroundStyle(colors[$0])
                }
            }
            .pickerStyle(.wheel)
            .padding()
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        EnvironmentView()
    } else {
    }
}
