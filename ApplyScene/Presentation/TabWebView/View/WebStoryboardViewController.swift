//
//  WebStoryboardViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/05/06.
//

import UIKit

class WebStoryboardViewController: UIViewController {
    
    static func instantiate() -> UIViewController {
        /// Storyboardのファイル名からStoryboardのインスタンスを生成
        let storyboard = UIStoryboard(name: "WebStoryboardViewController", bundle: nil)
        /// 指定された識別子を持つビューコントローラーを作成し、ストーリーボードのデータを使用して初期化します。
        /// withIdentifier - storyboardIDに設定
        let controller = storyboard.instantiateViewController(
            withIdentifier: "WebStoryboard"
        )
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
