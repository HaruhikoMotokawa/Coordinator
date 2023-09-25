//
//  SecondRedCoordinator.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

class SecondRedCoordinator: Coordinator {

  private let redViewController: UIViewController
  private var secondRedViewController: SecondRedViewController?

  init(redViewController: UIViewController) {
    self.redViewController = redViewController
  }

  func start() {
    let vc = SecondRedViewController()
    redViewController.present(vc, animated: true)
    secondRedViewController = vc
  }

}
