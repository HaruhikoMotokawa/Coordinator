//
//  SecondRedViewController.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

class SecondRedViewController: UIViewController {
  
  private let viewLabel: UILabel = {
    let label = UILabel()
    label.text = "SecondRedViewController"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.red

    view.addSubview(viewLabel)

    NSLayoutConstraint.activate([
      viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ])
  }
}

#Preview {
  let vc = SecondRedViewController()
  return vc
}
