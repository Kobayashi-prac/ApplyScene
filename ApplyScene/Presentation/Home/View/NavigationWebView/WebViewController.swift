//
//  WebViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/04/22.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
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
        // URLオブジェクトを生成
        let myURL = URL(string: "https://www.google.com/?hl=ja")
        // URLRequestオブジェクトを生成
        let myRequest = URLRequest(url: myURL!)
        // URLを WebView にロード
        webView.load(myRequest)
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
        if navigationAction.request.url?.absoluteString == "https://www.google.com/?hl=ja" {
            return .allow
        } else {
            return .cancel
        }
    }
}
