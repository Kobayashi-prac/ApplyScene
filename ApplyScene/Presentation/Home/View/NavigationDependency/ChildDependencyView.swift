//
//  ChildDependencyView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/04.
//

import SwiftUI

struct ChildDependencyView: View {
    
    var viewModel: DependencyViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

final class Coordinator {
    
    @ViewBuilder func destination() -> some View {
        let viewModel = DependencyViewModel()
        ChildDependencyView(viewModel: viewModel)
    }
}

#Preview {
    ChildDependencyView(viewModel: DependencyViewModel())
}
