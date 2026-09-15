//
//  DemoView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/24.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
        await takesTooLong()
        print("End \(Date())")
    }
    
    // Actorを引き継がない。別スレッドで実行させたいならこっちを使う。
    // nonisolated func takesTooLong() async {
    
    func takesTooLong() async {
        
        // スレッド自体を止めるため、リソースが解放されない
        // Thread.sleep(forTimeInterval: 5)
        
        try? await Task.sleep(for: .seconds(5))
        print("Async task completed at \(Date())")
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}

#Preview {
    DemoView()
}
