//
//  StackView2.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

struct StackView2: View {
    var body: some View {
        // VStackのコンテナビューについてサイズや座標空間を渡す
        GeometryReader { geometry in
            VStack {
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2,
                        height: (geometry.size.height / 4) * 2)
                Text("Goodbye World")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 3,
                        height: geometry.size.height / 4)
                Text("\(String(describing: geometry.frame(in: .global)))")
                Text("\(String(describing: geometry.frame(in: .local)))")
            }
        }
    }
}

#Preview {
    StackView2()
}
