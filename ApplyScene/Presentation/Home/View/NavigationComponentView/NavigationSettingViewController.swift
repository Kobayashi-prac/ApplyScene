//
//  NavigationSettingViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/09/21.
//

import UIKit

nonisolated enum Section {
    case main
    case settings
}

class NavigationSettingViewController: UIViewController {
    
    private let collectionView: UICollectionView
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>
    
    init() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: Self.makeLayout())
        dataSource = Self.makeDataSource(collectionView: collectionView)
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
    
    private static func makeLayout() -> UICollectionViewCompositionalLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    /// データソース生成
    private static func makeDataSource(collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Section, String> {
        // セル登録
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, String> { cell, _, item in
            var config = cell.defaultContentConfiguration()
            config.text = item
            cell.contentConfiguration = config
            cell.accessories = [.disclosureIndicator()]
        }
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { collection, indexPath, item in
            collection.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: item)
        }
    }
    
    private func setupCollectionView() {
        collectionView.frame = view.bounds
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
    }
    
    /// データ反映
    /// 実際のUI表示を作成する
    private func setupSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main, .settings])
        snapshot.appendItems(["りんご", "みかん"], toSection: .main)
        snapshot.appendItems(["通知"], toSection: .settings)
        dataSource.apply(snapshot)
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
//    barTintColor、titleTextAttributes、setBackgroundImage(_:for:)、shadowImage
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
