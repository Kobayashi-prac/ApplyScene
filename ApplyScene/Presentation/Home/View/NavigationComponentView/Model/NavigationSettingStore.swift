//
//  NavigationSettingStore.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/09/22.
//

import UIKit

nonisolated struct NavigationSettingStore {
    
    static var isHidden = false
    
    static var hidesBarsOnSwipe = false
    static var hidesBarsOnTap = false
    
    static var prefersLargeTitles = false   // 大きいタイトルを有効化（iOS 11+）
    static var tintColor: UIColor? = nil   // バーボタンや戻る矢印の色
    static var isTranslucent = false        // 半透明かどうか
    
    static var appearance: UINavigationBarAppearance?
    
    static var standardAppearance: UINavigationBarAppearance?
    static var scrollEdgeAppearance: UINavigationBarAppearance?
    static var compactAppearance: UINavigationBarAppearance?
    static var compactScrollEdgeAppearance: UINavigationBarAppearance?
    
    // 背景の基本設定（どれか一つを選ぶ）
    static var configureBackground: Background? = nil
    static var backgroundColor: UIColor?
    // 下線を消す
    static var shadowColor: UIColor?

//    // タイトルの文字
//    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)

    // タイトル
    static var title = false
    static var largeTitleDisplayMode: DisplayMode = .never // .automatic / .always
    
    static var topEdgeEffectStyle: EdgeEffectStyle = .automatic
    static var bottomEdgeEffectStyle: EdgeEffectStyle = .automatic
    // エフェクト自体を無効にする
    static var topEdgeEffectHidden = false
    
    static func reset() {
        isHidden = false
        hidesBarsOnSwipe = false
        hidesBarsOnTap = false
        prefersLargeTitles = false
        tintColor = nil
        isTranslucent = false
        configureBackground = nil
        backgroundColor = nil
        shadowColor = nil
        appearance = nil
        title = false
        largeTitleDisplayMode = .never
        topEdgeEffectStyle = .automatic
        bottomEdgeEffectStyle = .automatic
        topEdgeEffectHidden = false
    }
    
}
