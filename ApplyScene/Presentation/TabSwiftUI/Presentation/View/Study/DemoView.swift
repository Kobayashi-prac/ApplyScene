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
    
    func takesTooLong() async {
        Thread.sleep(forTimeInterval: 5)
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
