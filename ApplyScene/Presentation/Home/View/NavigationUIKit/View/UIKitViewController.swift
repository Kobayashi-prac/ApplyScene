//
//  UIKitViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/09.
//

import Foundation
import UIKit

class UIKitViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(#function)")
        print("\(view.safeAreaInsets)")
        
        setupView()
        setupNavigationBar(text: "First")
        
        Task {
            do {
                try await Task.sleep(for: .seconds(5))
                isNavigationBarHiddn(isHidden: true)
            } catch {
                print(error)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 画面表示前の処理を書く
        print("\(#function)：画面表示直前")
        print("\(view.safeAreaInsets)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(#function)：レイアウト処理開始")
        print("\(view.safeAreaInsets)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(#function)：レイアウト処理終了")
        print("\(view.safeAreaInsets)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面表示直後の処理を書く
        print("\(#function)：画面表示直後")
        print("\(view.safeAreaInsets)")
        
        setupNavigationBar(text: "A")
        DispatchQueue.main.async {
            self.setupNavigationBar(text: "C")
        }
        setupNavigationBar(text: "B")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 画面非表示直前の処理を書く
        print("\(#function)：画面非表示直前")
        print("\(view.safeAreaInsets)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // 画面非表示直後の処理を書く
        print("\(#function)：画面非表示直後")
        print("\(view.safeAreaInsets)")
    }
    
    private func setupView() {
        view.backgroundColor = .white
        setupViewConstraint()
    }
    
    private func setupViewConstraint() {
        let grayView = UIView()
        grayView.backgroundColor = .gray
        grayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayView)
        
        NSLayoutConstraint.activate ([
            grayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            grayView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            grayView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            grayView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar(text: String) {
        title = text
    }
    
    private func isNavigationBarHiddn(isHidden: Bool) {
        print("NavigationBar：\(isHidden ? "非表示" : "表示")")
        navigationController?.navigationBar.isHidden = isHidden
    }
}
