//
//  RedViewController.swift
//  Coordinator
//
//  Created by 本川晴彦 on 2023/09/25.
//

import UIKit

protocol RedViewControllerDelegate: AnyObject {
  func showSecondRedView()
}

final class RedViewController: UIViewController {

  weak var delegate: RedViewControllerDelegate?

  private let viewLabel: UILabel = {
    let label = UILabel()
    label.text = "ModalViewController"
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  // lazyをつけると初期化を遅延する、つまりVCの初期化が終わってから行われる
  private lazy var modalButton: UIButton = {
    let button = UIButton()
    button.setTitle("モーダル遷移", for: .normal)
    button.backgroundColor = .lightGray
    button.setTitleColor(.black, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    // ここのselfはVCのこと。VCが先に初期化されてる必要がある
    button.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    return button
  }()

  /// 画面遷移の処理だけど、Coordinatorに委任する
  @objc private func tapNextButton() {
    print("タップしたよ")
    delegate?.showSecondRedView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = UIColor.red

    view.addSubview(viewLabel)
    view.addSubview(modalButton)

    NSLayoutConstraint.activate([
    viewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    viewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

    modalButton.topAnchor.constraint(equalTo: viewLabel.bottomAnchor, constant: 50),
    modalButton.centerXAnchor.constraint(equalTo: viewLabel.centerXAnchor)
    ])

  }
}

#Preview {
  let vc = RedViewController()
  return vc
}
