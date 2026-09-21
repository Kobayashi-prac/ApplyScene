//
//  UIKitViewController.swift
//  ApplyScene
//
//  Created by swiftUI on 2026/09/16.
//

import UIKit

enum NavigationBarType {
    case prefersLargeTitles
    case hidesBarsOnSwipe
    case hidesBarsOnTap
    case interactivePopGestureRecognizer
}

enum NavigationItemType {
    case title
    case titleView
    case rightBarButtonItems
    case leftBarButtonItem
    case hidesBackButton
    case backButtonTitle
    case backButtonDisplayMode
    case largeTitleDisplayMode
    case searchController
    case hidesSearchBarWhenScrolling
}

class UIKitViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("遷移", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        return button
    }()
    
    private let pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    var value = ["犬", "猫", "兎", "狐"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupButton()
        setupPickerView()
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setupButton() {
        view.addSubview(button)
        setupButtonConstraint()
    }
    
    private func setupPickerView() {
        view.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        setupPickerConstraint()
    }
    
    private func setupButtonConstraint() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupPickerConstraint() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func didTapButton() {
        print("押下")
    }
    
}

extension UIKitViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return value.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return value[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(value[row])")
    }
    
}
