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
                    /// アクターを継承して、メインスレッドで実施
                    /// await：実際にサスペンドするところ
                    await hoge()
                    /// Actorのメソッドを呼び出しているためawait
                    /// Actorのメソッドを呼び出しているため別Actorで実行
                    await Worker().start()
                }
                Task.detached {
                    /// アクターを継承せず、別スレッドで実施
                    print("detached")
                }
                Task { @concurrent in
                    /// アクターを継承せず、別スレッドで実施
                    print("@concurrent")
                }
                print("C")
            }
    }
    
    /// async：サスペンドする処理
    func hoge() async {
        print("D")
        do {
            try await Task.sleep(for: .seconds(3))
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
    }
}

#Preview {
    TabSwiftUIView()
}
