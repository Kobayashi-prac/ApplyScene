//
//  WebViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    private let url = "https://www.google.com/?hl=ja"
    
    private var webView: WKWebView = {
        // WKWebViewConfiguration の生成
        let webConfiguration = WKWebViewConfiguration()
        // WKWebView に Configuration を引き渡し initialize
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        return webView
    }()
    
    override func loadView() {
        // WKUIDelegate の移譲先として self を登録
        webView.uiDelegate = self
        // WKNavigationDelegate の移譲先として self を登録
        webView.navigationDelegate = self
        // 6 view に webView を割り当て
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Thread.sleep(forTimeInterval: 5)
        print("hoge")
    }
    
    private func setupWebView() {
        // URLオブジェクトを生成
        let myURL = URL(string: url)
        // URLRequestオブジェクトを生成
        let myRequest = URLRequest(url: myURL!)
        // URLを WebView にロード
        webView.load(myRequest)
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = "タイトル"
        
        let appearance = UINavigationBarAppearance()
        
        // これらは背景系の値を一気に上書きするため背景色などの設定は後に行う
        // 半透明
//        appearance.configureWithDefaultBackground()
        // 背景が透けない
//        appearance.configureWithOpaqueBackground()
        // 完全に透明
        appearance.configureWithTransparentBackground()
        
        // バーに背景色を設定
//        appearance.backgroundColor = .systemBackground
        
        let bar = navigationController?.navigationBar
        bar?.standardAppearance = appearance
        bar?.scrollEdgeAppearance = appearance
    }
}

// MARK: - WKWebView ui delegate
extension WebViewController: WKUIDelegate {
    // delegate
}

// MARK: - WKWebView WKNavigation delegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        return .allow
    }
}
