//
//  SecondViewController.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

class SecondViewController: UIViewController {

  let viewLabel: UILabel = {
    let label = UILabel()
    label.text = "SecondViewController"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    return label
  }()

  deinit {
    print("SecondViewControllerを解放したぜ！")
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor.systemBackground
      view.addSubview(viewLabel)
      viewLabel.translatesAutoresizingMaskIntoConstraints = false
      viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

#Preview {
  let vc = SecondViewController()
  return vc
}
