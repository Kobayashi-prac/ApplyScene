//
//  TabSwiftUIView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/05.
//

import SwiftUI

struct TabSwiftUIView: View {
    var body: some View {
        Text("SwiftUI")
            .onAppear {
                print("A")
                Task {
                    // 関数がasyncだからawaitをつける
                    /// await：実際にサスペンドするところ
//                    await hoge()
                    await Worker().start()
                }
                print("C")
            }
    }
    
    /// async：サスペンドする処理
    func hoge() async {
        do {
            try await Task.sleep(nanoseconds: 5)
        } catch {
            print(error)
        }
        print("B")
    }
}

struct Work: Sendable {}

actor Worker {
    var work: Task<Void, Never>?
    var result: Work?


    deinit {
        // even though the task is still retained,
        // once it completes it no longer causes a reference cycle with the actor


        print("deinit actor")
    }


    func start() {
        work = Task {
            print("start task work")
            try? await Task.sleep(for: .seconds(3))
            self.result = await Work() // we captured self
            print("completed task work")
            // but as the task completes, this reference is released
        }
        // we keep a strong reference to the task
        print("一番最初")
    }
}

#Preview {
    TabSwiftUIView()
}
