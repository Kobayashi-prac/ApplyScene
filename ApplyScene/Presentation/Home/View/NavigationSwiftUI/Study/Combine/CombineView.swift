//
//  CombineView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

struct CombineView: View {
    
    @StateObject var viewModel = CombineViewStore(player: "John")
    
    var body: some View {
        VStack {
            Text("\(viewModel.playerName)'s Score = \(viewModel.score)")
            Button {
                viewModel.updateData()
            } label: {
                Text("Update")
            }
            .padding()
        }
    }
}

#Preview {
    CombineView()
}
