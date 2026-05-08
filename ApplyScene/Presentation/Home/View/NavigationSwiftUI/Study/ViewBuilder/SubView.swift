//
//  SubView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/12.
//

import SwiftUI

struct SubView<Content: View>: View {
    
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .font(.largeTitle)
    }
}

//#Preview {
//    SubView()
//}
