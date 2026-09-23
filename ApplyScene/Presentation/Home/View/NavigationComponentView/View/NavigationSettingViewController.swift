//
//  NavigationSettingViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/09/21.
//

import UIKit

nonisolated enum Section: CaseIterable {
    case push
    case isHidden
    case barSetting
    case barAppearance
    case backgroundAppearance
//    case titleAppearance
    case title
    case edgeEffect
    
    var items: [Item] {
        switch self {
        case .push:
            return [.native, .webView]
        case .isHidden:
            return [.barIsHidden, .hidesBarsOnSwipe, .hidesBarsOnTap]
        case .barSetting:
            return [.prefersLargeTitles, .tintColor, .isTranslucent]
        case .barAppearance:
            return [.standardAppearance, .scrollEdgeAppearance, .compactAppearance, .compactScrollEdgeAppearance]
        case .backgroundAppearance:
            return [.backgroundConfigure, .backgroundColor, .shadowColor]
//        case .titleAppearance:
//            return [.native, .webView]
        case .title:
            return [.title, .largeTitleDisplayMode]
        case .edgeEffect:
            return [.topEdgeEffect, .bottomEdgeEffect, .topEdgeEffectHidden]
        }
    }
}

nonisolated enum Item: String {
    // push
    case native = "Native"
    case webView = "WebView"
    
    // isHidden
    case barIsHidden
    case hidesBarsOnSwipe
    case hidesBarsOnTap
    
    // barSetting
    case prefersLargeTitles
    case tintColor
    case isTranslucent
    
    // barAppearance
    case standardAppearance
    case scrollEdgeAppearance
    case compactAppearance
    case compactScrollEdgeAppearance
    
    // backgroundAppearance
    case backgroundConfigure
    case backgroundColor
    case shadowColor
    
    // title
    case title
    case largeTitleDisplayMode
    
    // edgeEffect
    case topEdgeEffect
    case bottomEdgeEffect
    case topEdgeEffectHidden
    
    enum MenuType {
        case color
        case background
        case displayMode
        case edgeEffectStyle
    }
    
    var currentState: Bool {
        switch self {
        case .barIsHidden:
            return NavigationSettingStore.isHidden
        case .hidesBarsOnSwipe:
            return NavigationSettingStore.hidesBarsOnSwipe
        case .hidesBarsOnTap:
            return NavigationSettingStore.hidesBarsOnTap
        case .prefersLargeTitles:
            return NavigationSettingStore.prefersLargeTitles
        case .isTranslucent:
            return NavigationSettingStore.isTranslucent
        case .title:
            return NavigationSettingStore.title
        case .topEdgeEffectHidden:
            return NavigationSettingStore.topEdgeEffectHidden
        default:
            return false
        }
    }
    
    var currentColor: UIColor? {
        switch self {
        case .tintColor:
            return NavigationSettingStore.tintColor
        case .backgroundColor:
            return NavigationSettingStore.backgroundColor
        case .shadowColor:
            return NavigationSettingStore.backgroundColor
        default:
            return nil
        }
    }
    
    var currentBackground: Background? {
        switch self {
        case .backgroundConfigure:
            return NavigationSettingStore.configureBackground
        default:
            return nil
        }
    }
    
    var currentDisplayMode: DisplayMode? {
        switch self {
        case .largeTitleDisplayMode:
            return NavigationSettingStore.largeTitleDisplayMode
        default:
            return nil
        }
    }
    
    var currentEdgeEffectStyle: EdgeEffectStyle? {
        switch self {
        case .topEdgeEffect:
            return NavigationSettingStore.topEdgeEffectStyle
        case .bottomEdgeEffect:
            return NavigationSettingStore.bottomEdgeEffectStyle
        default:
            return nil
        }
    }
    
    func updateState(state: Bool) {
        switch self {
        case .barIsHidden:
            NavigationSettingStore.isHidden = state
        case .hidesBarsOnSwipe:
            NavigationSettingStore.hidesBarsOnSwipe = state
        case .hidesBarsOnTap:
            NavigationSettingStore.hidesBarsOnTap = state
        case .prefersLargeTitles:
            NavigationSettingStore.prefersLargeTitles = state
        case .isTranslucent:
            NavigationSettingStore.isTranslucent = state
        case .title:
            NavigationSettingStore.title = state
        case .topEdgeEffectHidden:
            NavigationSettingStore.topEdgeEffectHidden = state
        default:
            break
        }
    }
    
    func updateColor(color: UIColor) {
        switch self {
        case .tintColor:
            NavigationSettingStore.tintColor = color
        case .backgroundColor:
            NavigationSettingStore.backgroundColor = color
        case .shadowColor:
            NavigationSettingStore.backgroundColor = color
        default:
            break
        }
    }
    
    func updateBackground(background: Background) {
        switch self {
        case .backgroundConfigure:
            NavigationSettingStore.configureBackground = background
        default:
            break
        }
    }
    
    func updateDisplayMode(mode: DisplayMode) {
        switch self {
        case .largeTitleDisplayMode:
            NavigationSettingStore.largeTitleDisplayMode = mode
        default:
            break
        }
    }
    
    func updateDisplayMode(style: EdgeEffectStyle) {
        switch self {
        case .topEdgeEffect:
            NavigationSettingStore.topEdgeEffectStyle = style
        case .bottomEdgeEffect:
            NavigationSettingStore.bottomEdgeEffectStyle = style
        default:
            break
        }
    }
    
}

enum ThemeColor: String, CaseIterable {
    case clear
    case systemBackground
    case white
    case black
    case blue
    
    var color: UIColor {
        switch self {
        case .clear:
            return .clear
        case .systemBackground:
            return .systemBackground
        case .white:
            return .white
        case .black:
            return .black
        case .blue:
            return .systemBlue
        }
    }
    
    var title: String {
        switch self {
        case .clear:
            return "クリア"
        case .systemBackground:
            return "システム背景"
        case .white:
            return "ホワイト"
        case .black:
            return "ブラック"
        case .blue:
            return "ブルー"
        }
    }
}

enum Background: String, CaseIterable {
    /// 不透明
    case withOpaque
    /// 標準のぼかし
    case withDefault
    /// 透明？
    case withTransparent
}

enum DisplayMode: String, CaseIterable {
    case always
    case automatic
    case never
}

enum EdgeEffectStyle: String, CaseIterable {
    /// システムにおまかせ(デフォルト)
    case automatic
    /// ぼかしが徐々にフェードする柔らかい効果
    case soft
    /// 境界がはっきりした、より不透明で強い効果
    case hard
}

class NavigationSettingViewController: UIViewController {
    
    private let collectionView: UICollectionView
    private var registration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: Self.makeLayout())
        registration = Self.makeRegistration()
        dataSource = Self.makeDataSource(collectionView: collectionView, registration: registration)
        super.init(nibName: nil, bundle: nil)
    }
    
    // Storyboard や xib から画面を生成するときに UIKit が呼ぶイニシャライザ
    // サブクラスで独自の指定イニシャライザ(init() など)を定義していない
    // 追加したプロパティがすべて初期値を持っている(または Optional や lazy)
    // 上記以外の場合、自動継承が打ち切られるため必須イニシャライザを自分で書く必要がある
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSnapshot()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NavigationSettingStore.reset()
    }
    
    private static func makeLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    private static func makeRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        // セル登録
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, _, item in
            var config = cell.defaultContentConfiguration()
            config.text = item.rawValue
            cell.contentConfiguration = config
            switch item {
            case .barIsHidden,
                    .hidesBarsOnSwipe,
                    .hidesBarsOnTap,
                    .prefersLargeTitles,
                    .isTranslucent,
                    .title,
                    .topEdgeEffectHidden:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createToggle(item: item), placement: .trailing()))]
            case .tintColor,
                    .backgroundColor,
                    .shadowColor:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createMenu(item: item, type: .color), placement: .trailing()))]
            case .largeTitleDisplayMode:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createMenu(item: item, type: .displayMode), placement: .trailing()))]
            case .topEdgeEffect,
                    .bottomEdgeEffect:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createMenu(item: item, type: .edgeEffectStyle), placement: .trailing()))]
            case .standardAppearance,
                    .scrollEdgeAppearance,
                    .compactAppearance,
                    .compactScrollEdgeAppearance:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createButton(item: item), placement: .trailing()))]
            case .backgroundConfigure:
                cell.accessories = [UICellAccessory.customView(configuration: .init(customView: Self.createMenu(item: item, type: .background), placement: .trailing()))]
            default:
                break
            }
        }
        return registration
    }
    
    /// データソース生成
    private static func makeDataSource(collectionView: UICollectionView,
                                       registration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>) -> UICollectionViewDiffableDataSource<Section, Item> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { collection, indexPath, item in
            collection.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
        }
    }
    
    private static func createToggle(item: Item) -> UISwitch {
        let toggle = UISwitch()
        toggle.isOn = item.currentState
        toggle.addAction(UIAction { action in
            item.updateState(state: toggle.isOn)
        }, for: .valueChanged)
        return toggle
    }
    
    private static func createMenu(item: Item, type: Item.MenuType) -> UIButton {
        let button = UIButton(configuration: .plain())
        button.showsMenuAsPrimaryAction = true
        button.changesSelectionAsPrimaryAction = true
        switch type {
        case .color:
            button.menu = UIMenu(children: ThemeColor.allCases.map { theme in
                UIAction(title: theme.title,
                         image: UIImage(systemName: "circle.fill")?
                    .withTintColor(theme.color, renderingMode: .alwaysOriginal),
                         state: theme.color == item.currentColor ? .on : .off) { _ in
                    item.updateColor(color: theme.color)
                }
            })
        case .background:
            button.menu = UIMenu(children: Background.allCases.map { config in
                UIAction(title: config.rawValue,
                         state: config == item.currentBackground ? .on : .off) { _ in
                    item.updateBackground(background: config)
                }
            })
        case .displayMode:
            button.menu = UIMenu(children: DisplayMode.allCases.map { config in
                UIAction(title: config.rawValue,
                         state: config == item.currentDisplayMode ? .on : .off) { _ in
                    item.updateDisplayMode(mode: config)
                }
            })
        case .edgeEffectStyle:
            button.menu = UIMenu(children: EdgeEffectStyle.allCases.map { config in
                UIAction(title: config.rawValue,
                         state: config == item.currentEdgeEffectStyle ? .on : .off) { _ in
                    item.updateDisplayMode(style: config)
                }
            })
        }
        return button
    }
    
    private static func createButton(item: Item) -> UIButton {
        let button = UIButton(configuration: .plain(),
                              primaryAction: UIAction { _ in
            Self.saveAppearance(item: item)
        })
        button.setTitle("保存", for: .normal)
        return button
    }
    
    private static func saveAppearance(item: Item) {
        
        NavigationSettingStore.appearance = UINavigationBarAppearance()
        
        setBackgroundConfigure()
        
        // isTranslucentをfalseにしないとデフォルトで半透明
        NavigationSettingStore.appearance?.backgroundColor = NavigationSettingStore.backgroundColor // barTintColorの代わり
        NavigationSettingStore.appearance?.shadowColor = NavigationSettingStore.shadowColor   // 下線を消す
        
        // iOS 13以降は Appearance で設定するのが推奨（下記参照）
        // barに設定する項目のいくつかはappearanceで設定するようになった
        switch item {
        case .standardAppearance:
            NavigationSettingStore.standardAppearance = NavigationSettingStore.appearance
        case .scrollEdgeAppearance:
            NavigationSettingStore.scrollEdgeAppearance = NavigationSettingStore.appearance
        case .compactAppearance:
            NavigationSettingStore.compactAppearance = NavigationSettingStore.appearance
        case .compactScrollEdgeAppearance:
            NavigationSettingStore.compactScrollEdgeAppearance = NavigationSettingStore.appearance
        default:
            break
        }
    }
    
    private static func setBackgroundConfigure() {
        // 背景の基本設定（どれか一つを選ぶ）
        switch NavigationSettingStore.configureBackground {
        case .withOpaque:
            NavigationSettingStore.appearance?.configureWithOpaqueBackground()      // 不透明
        case .withDefault:
            NavigationSettingStore.appearance?.configureWithDefaultBackground()     // 標準のぼかし
        case .withTransparent:
            NavigationSettingStore.appearance?.configureWithTransparentBackground() // 透明
        default:
            break
        }
    }
    
    private func setupCollectionView() {
        collectionView.frame = view.bounds
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
    
    /// データ反映
    /// 実際のUI表示を作成する
    private func setupSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        
        snapshot.appendSections(Section.allCases)
        
        for section in Section.allCases {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource.apply(snapshot)
    }
    
}

extension NavigationSettingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.itemIdentifier(for: indexPath)
        if item == .native || item == .webView {
            
            // スクロールやスワイプに連動して隠す
            navigationController?.isNavigationBarHidden = NavigationSettingStore.isHidden
            navigationController?.hidesBarsOnSwipe = NavigationSettingStore.hidesBarsOnSwipe
            navigationController?.hidesBarsOnTap = NavigationSettingStore.hidesBarsOnTap
            
            let bar = navigationController!.navigationBar
            
            bar.prefersLargeTitles = NavigationSettingStore.prefersLargeTitles // 大きいタイトルを有効化（iOS 11+）
            bar.tintColor = NavigationSettingStore.tintColor // バーボタンや戻る矢印の色
            print("windowのtintColor：\(String(describing: view.window?.tintColor))")
            bar.isTranslucent = NavigationSettingStore.isTranslucent // 半透明かどうか
            
//            let appearance = UINavigationBarAppearance()
//            
//            // タイトルの文字
//            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            // タイトル
            navigationItem.title = NavigationSettingStore.title ? "タイトル" : nil
            // prefersLargeTitles：バー全体
            // largeTitleDisplayMode：画面ごと
            switch NavigationSettingStore.largeTitleDisplayMode {
            case .always:
                navigationItem.largeTitleDisplayMode = .always
            case .automatic:
                navigationItem.largeTitleDisplayMode = .automatic
            case .never:
                navigationItem.largeTitleDisplayMode = .never
            }
            
            if let appearance = NavigationSettingStore.standardAppearance {
                navigationController?.navigationBar.standardAppearance = appearance
            }
            // スクロール最上部にいるとき
            navigationController?.navigationBar.scrollEdgeAppearance = NavigationSettingStore.scrollEdgeAppearance
            // 横向きなどの低いバー
            navigationController?.navigationBar.compactAppearance = NavigationSettingStore.compactAppearance
            // iOS 15+
            navigationController?.navigationBar.compactScrollEdgeAppearance = NavigationSettingStore.compactScrollEdgeAppearance
            
            navigationController?.pushViewController(createViewController(item: item), animated: true)
        }
    }
    
    private func createViewController(item: Item?) -> UIViewController {
        switch item {
        case .native:
            return NativeViewController()
        case .webView:
            return WebViewController()
        default:
            return UIViewController()
        }
    }
}
    
//    // スクロールやスワイプに連動して隠す
//    navigationController?.hidesBarsOnSwipe = true
//    navigationController?.hidesBarsOnTap = true
//    navigationController?.hidesBarsWhenKeyboardAppears = true
//
//    let bar = navigationController!.navigationBar
//
//    bar.prefersLargeTitles = true   // 大きいタイトルを有効化（iOS 11+）
//    bar.tintColor = .systemOrange   // バーボタンや戻る矢印の色
//    bar.isTranslucent = true        // 半透明かどうか
//    bar.barStyle = .default
//
//    // iOS 13以降は Appearance で設定するのが推奨（下記参照）
//    bar.standardAppearance = appearance
//    bar.scrollEdgeAppearance = appearance   // スクロール最上部にいるとき
//    bar.compactAppearance = appearance      // 横向きなどの低いバー
//    bar.compactScrollEdgeAppearance = appearance // iOS 15+
//
//    let appearance = UINavigationBarAppearance()
//
//    // 背景の基本設定（どれか一つを選ぶ）
//    appearance.configureWithOpaqueBackground()      // 不透明
//    appearance.configureWithDefaultBackground()     // 標準のぼかし
//    appearance.configureWithTransparentBackground() // 透明
//
//    appearance.backgroundColor = .systemBlue
//    appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
//    appearance.backgroundImage = UIImage(named: "bg")
//    appearance.shadowColor = .clear   // 下線を消す
//
//    // タイトルの文字
//    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    appearance.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
//
//    // ボタンの見た目
//    appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
//    appearance.doneButtonAppearance = UIBarButtonItemAppearance(style: .done)
//    appearance.backButtonAppearance = UIBarButtonItemAppearance()
//
//    // 戻る矢印の画像
//    appearance.setBackIndicatorImage(img, transitionMaskImage: img)
//    
//    // タイトル
//    navigationItem.title = "設定"
//    navigationItem.titleView = customView
//    navigationItem.largeTitleDisplayMode = .always // .automatic / .never
//
//    // 左右のボタン
//    navigationItem.rightBarButtonItem = UIBarButtonItem(
//        barButtonSystemItem: .add, target: self, action: #selector(add))
//    navigationItem.rightBarButtonItems = [item1, item2]
//    navigationItem.leftBarButtonItem = editButtonItem
//    navigationItem.leftItemsSupplementBackButton = true // 戻るボタンと共存
//
//    // 戻るボタン（※遷移「元」の画面で設定する点に注意）
//    navigationItem.backButtonTitle = "戻る"
//    navigationItem.backButtonDisplayMode = .minimal // 矢印のみ（iOS 14+）
//    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//    navigationItem.hidesBackButton = true
//    navigationItem.setHidesBackButton(true, animated: true)
//
//    // 検索バー
//    navigationItem.searchController = UISearchController(searchResultsController: nil)
//    navigationItem.hidesSearchBarWhenScrolling = false
//
//    // この画面だけ見た目を変える
//    navigationItem.standardAppearance = appearance
//    navigationItem.scrollEdgeAppearance = appearance
//
//    // iOS 16+
//    navigationItem.style = .navigator   // .browser / .editor
//    navigationItem.centerItemGroups = [...]
//    navigationItem.titleMenuProvider = { suggested in UIMenu(children: suggested) }
//    navigationItem.renameDelegate = self
//    
//    // 生成方法いろいろ
//    UIBarButtonItem(title: "保存", style: .done, target: self, action: #selector(save))
//    UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(open))
//    UIBarButtonItem(systemItem: .edit, primaryAction: UIAction { _ in ... })  // iOS 14+
//    UIBarButtonItem(title: "並べ替え", menu: UIMenu(children: [...]))          // メニュー付き
//    UIBarButtonItem(customView: myButton)
//
//    item.isEnabled = false
//    item.tintColor = .systemRed
//    item.isHidden = true   // iOS 16+
//    
//    edge effect
//    UITableView / UICollectionView も UIScrollView のサブクラスなので同様に使える
//    tableView.topEdgeEffect.style = .soft     // ナビゲーションバー側
//    tableView.bottomEdgeEffect.style = .hard  // タブバー・ツールバー側
//
//    // エフェクト自体を無効にする
//    tableView.topEdgeEffect.isHidden = true
