//
//  ObservationView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

@available(iOS 17.0, *)
struct ObservationView: View {
    
    @State var viewModel = ObservationViewModel(name: "John")
    
    var body: some View {
        VStack {
            Text("\(viewModel.playerName)'s Score = \(viewModel.score)")
            Button {
                viewModel.update()
            } label: {
                Text("Update")
            }
            .padding()
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ObservationView()
    }
}
