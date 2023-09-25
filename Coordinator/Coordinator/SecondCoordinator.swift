//
//  SecondCoordinator.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

final class SecondCoordinator: Coordinator {

  private let navigator: UINavigationController
  private var secondViewController: SecondViewController?

  deinit {
    print("SecondCoordinator instance is deallocated.")
  }

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    let vc = SecondViewController()
    // ①
    navigator.pushViewController(vc, animated: true)
    secondViewController = vc
  }

}
