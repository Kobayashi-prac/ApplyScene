//
//  StackView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/12.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Text("Financial Results")
                .font(.title)
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                Spacer()
                VStack(alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("$10000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(5)
            }
            .padding(5)
        }
        .padding(5)
        Group {
            Text("Sample Text")
            Text("Sample Text")
        }
        HStack {
            Text("Sample Text")
            Image(systemName: "airplane")
            Text("Flight times:")
                .layoutPriority(1)
            Text("London")
        }
        .font(.largeTitle)
        .lineLimit(1)
        .padding()
        
        Text("Hello World, how are you? I'm Jhon")
            .font(.largeTitle)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,
                   maxHeight: .infinity, alignment: .center)
            .border(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    StackView()
}
