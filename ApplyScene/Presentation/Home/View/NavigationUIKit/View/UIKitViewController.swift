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
        setupNavigationBar()
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
        
    }
    
    private func setupNavigationBar() {
        title = "First"
    }
}
