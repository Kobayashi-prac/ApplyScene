//
//  DataBindingView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/14.
//

import SwiftUI

@available(iOS 17.0, *)
struct DataBindingView: View {
    
    @State private var userName: String = ""
    @State private var wifiEnabled: Bool = false
    
    @Bindable var viewModel = DataBindingViewModel(playerName: "John")
    
    var body: some View {
        TextField("文字を入力してください", text: $userName)
        Text(userName)
        Toggle(isOn: $wifiEnabled) {
            Text("Enable Wi-Fi")
        }
        WifiImageView(wifiEnabled: $wifiEnabled)
        
        VStack {
            ScoreView(score: $viewModel.score)
            Text("\(viewModel.name)'s Score")
            Button(action: {
                viewModel.update()
            }, label: {
                Text("Update")
            })
            .padding()
        }
    }
}

struct WifiImageView: View {
    
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

struct ScoreView: View {
    
    @Binding var score: Int
    
    var body: some View {
        Text("\(score)")
            .font(.system(size: 150))
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        DataBindingView()
    } else {
        // Fallback on earlier versions
    }
}
