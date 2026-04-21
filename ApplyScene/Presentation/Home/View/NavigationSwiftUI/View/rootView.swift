//
//  rootView.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/04.
//

import SwiftUI

struct rootView: View {
    
    var completion: ((Bool) -> Void)?
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            Button {
                completion?(true)
                isPresented = true
            } label: {
                Text("子ビューへ")
            }
            .navigationDestination(isPresented: $isPresented) {
                if #available(iOS 17.0, *) {
                    EnvironmentView()
                } else {
                    // Fallback on earlier versions
                }
            }
            .onAppear {
                completion?(false)
            }
        }
    }
}

#Preview {
    rootView()
}
