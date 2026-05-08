//
//  MainTabBarController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/05.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        
        let home = UINavigationController(rootViewController: HomeViewController())
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let uiKit = TabUIKitView()
        uiKit.tabBarItem = UITabBarItem(title: "UIKit", image: UIImage(systemName: "rectangle.on.rectangle"), selectedImage: nil)
        
        let swiftUI = UIHostingController(rootView: TabSwiftUIView())
        swiftUI.tabBarItem = UITabBarItem(title: "SwiftUI", image: UIImage(systemName: "swift"), selectedImage: nil)

        let webView = UIHostingController(rootView: TabWebView())
        webView.tabBarItem = UITabBarItem(title: "WebView", image: UIImage(systemName: "globe"), selectedImage: nil)

        let pip = UIHostingController(rootView: TabPIPView())
        pip.tabBarItem = UITabBarItem(title: "PIP", image: UIImage(systemName: "pip.fill"), selectedImage: nil)
        
        viewControllers = [home, uiKit, swiftUI, webView, pip]
        selectedIndex = 0
    }
}
