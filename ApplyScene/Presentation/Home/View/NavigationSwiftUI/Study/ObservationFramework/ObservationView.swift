//
//  ObservationView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

@available(iOS 17.0, *)
struct ObservationView: View {
    
    // 普通の変数として宣言して使える
    // var data: ObservationData = ObservationData(name: "John")
    
    // データバインディングできるようになる
    // @Bindable var data: ObservationData = ObservationData(name: "John")
    
    // ビューにオブジェクトを所有させる場合は、State
    @State var data = ObservationData(name: "John")
    
    var body: some View {
        VStack {
            Text("\(data.playerName)'s Score = \(data.score)")
            Button {
                data.update()
            } label: {
                Text("Update")
            }
            .padding()
            ScoreView(score: $data.score)
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ObservationView()
    }
}
