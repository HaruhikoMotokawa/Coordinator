//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

// ①Coordinatorプロトコルを継承
// VCのインスタンスを保持して、画面遷移を担当する
final class FirstCoordinator: Coordinator {

  private let navigator: UINavigationController
  private var firstViewController: FirstViewController?
  private var secondCoordinator: SecondCoordinator?
  private var redCoordinator: RedCoordinator?

  // ②今回は初期化時にUINavigationControllerを代入
  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  // ③vcを初期化し、自身のプロパティとして保持する
  func start() {
    let vc = FirstViewController()
    vc.delegate = self
    // FirstViewControllerが最初の画面であると設定（リセット）
    self.navigator.viewControllers = [vc]
    self.firstViewController = vc
  }
}

// SecondViewControllerに画面遷移するためにSecondCoordinatorを起動する
extension FirstCoordinator: FirstViewControllerDelegate {

  func navigateToNextPage() {
    // SecondCoordinatorを初期化する際に保持していたUINavigationControllerを渡す
    let secondCoordinator = SecondCoordinator(navigator: self.navigator)
    // secondCoordinatorを起動、つまり画面遷移処理の実行
    secondCoordinator.start()
    // 画面遷移後にSecondCoordinatorを保持しておく
    self.secondCoordinator = secondCoordinator
  }

  func showRedView() {
    let redCoordinator = RedCoordinator(navigator: self.navigator)
    redCoordinator.start()
    self.redCoordinator = redCoordinator
  }



}
