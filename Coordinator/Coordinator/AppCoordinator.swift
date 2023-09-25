//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

/// このプロトコルで画面遷移のインターフェースを共通化
protocol Coordinator {
  func start()
}
/// 初期起動経路を管理するクラス
final class AppCoordinator: Coordinator {

  // プロパティとしてUIWindowとUINavigationControllerを保持する
  private let window: UIWindow
  private let rootViewController: UINavigationController

  // AppCoordinatorに最初の画面のCoordinatorを紐づけて親子関係にする
  // 子がFirstCoordinator
  private var firstCoordinator: FirstCoordinator

  // windowとUINavigationControllerを初期化
  init(window: UIWindow) {
    self.window = window
    rootViewController = .init()
    // 初期化時にFirstCoordinatorのインスタンスを保持、この時に
    // UINavigationControllerをrootとして渡す
    firstCoordinator = FirstCoordinator(navigator: rootViewController)
  }

  func start() {
    // firstCoordinatorを起動（つまりFirstVCに画面遷移）
    firstCoordinator.start()

    // 保持していたUINavigationControllerをwindowのrootに設定してアクティブにする
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
  }
}
