//
//  ChildView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/10.
//

import SwiftUI

struct ChildView: View {
    var body: some View {
        VStack {
            SubView {
                Text("Text 1")
                Text("Text 2")
                HStack {
                    Image(systemName: "star.fill")
                    Image(systemName: "star.fill")
                    Image(systemName: "star")
                }
            }
            Image(systemName: "car.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Sample Text")
                .font(.custom("Copperplate", size: 70))
            Label("Welcome to SwiftUI", systemImage: "person.circle.fill")
                .padding(20)
                .border(Color.red)
            Text("Child View")
                .modifier(StandardTitle())
        }
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 0, y: 5)
    }
}

#Preview {
    ChildView()
}
