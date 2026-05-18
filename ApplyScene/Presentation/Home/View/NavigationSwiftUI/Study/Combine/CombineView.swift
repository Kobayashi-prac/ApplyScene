//
//  CombineView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

struct CombineView: View {
    
    // ビューにオブジェクトを所有させない
    // 再描画時に、破棄される可能性あり
    // @ObservedObject var data = DemoData(player: "John")
    
    // ObservedObjectの改良版
    // 再描画時に破棄されない
    @StateObject var data = DemoData(player: "John")
    
    var body: some View {
        VStack {
            Text("\(data.playerName)'s Score = \(data.score)")
            Button {
                data.updateData()
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
