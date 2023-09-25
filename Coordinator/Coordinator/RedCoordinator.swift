//
//  RedCoordinator.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

class RedCoordinator: Coordinator {

  private let navigator: UINavigationController
  private var redViewController: RedViewController?
  private var secondRedCoordinator: SecondRedCoordinator?

  init(navigator: UINavigationController) {
    self.navigator = navigator
  }

  func start() {
    let vc = RedViewController()
    vc.delegate = self
    navigator.present(vc, animated: true)
    redViewController = vc
  }
  
}

extension RedCoordinator: RedViewControllerDelegate {
  func showSecondRedView() {
    let secondRedCoordinator = SecondRedCoordinator(redViewController: redViewController!)
    secondRedCoordinator.start()
    self.secondRedCoordinator = secondRedCoordinator
  }
}
