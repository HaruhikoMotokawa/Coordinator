//
//  FirstViewController.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/24.
//

import UIKit

/// 画面遷移の処理を委任するためのプロトコル
protocol FirstViewControllerDelegate: AnyObject {
  func navigateToNextPage()
  func showRedView()
}

class FirstViewController: UIViewController {

  /// 画面遷移するためのデリゲートを保持
  weak var delegate: FirstViewControllerDelegate?

  private var mainView: UIView = {
    let mainView = UIView()
    mainView.backgroundColor = .blue
    return mainView
  } ()


  // lazyをつけると初期化を遅延する、つまりVCの初期化が終わってから行われる
  private lazy var pushButton: UIButton = {
    let button = UIButton()
    button.setTitle("プッシュ遷移", for: .normal)
    button.backgroundColor = .gray
    button.tintColor = .green
    button.translatesAutoresizingMaskIntoConstraints = false
    // ここのselfはVCのこと。VCが先に初期化されてる必要がある
    button.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    return button
  }()

  // lazyをつけると初期化を遅延する、つまりVCの初期化が終わってから行われる
  private lazy var modalButton: UIButton = {
    let button = UIButton()
    button.setTitle("モーダル遷移", for: .normal)
    button.backgroundColor = .blue
    button.tintColor = .green
    button.translatesAutoresizingMaskIntoConstraints = false
    // ここのselfはVCのこと。VCが先に初期化されてる必要がある
    button.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = UIColor.systemBackground

    self.view.addSubview(pushButton)
    self.view.addSubview(modalButton)
    NSLayoutConstraint.activate([
      pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      modalButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor,
                                       constant: 20),
      modalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }

  /// 画面遷移の処理だけど、Coordinatorに委任する
  @objc private func tapNextButton(sender: UIButton) {
    switch sender {
      case pushButton:
        delegate?.navigateToNextPage()
      case modalButton:
        delegate?.showRedView()
      default:
        break
    }
  }
}

#Preview {
  let vc = FirstViewController()
  return vc
}
