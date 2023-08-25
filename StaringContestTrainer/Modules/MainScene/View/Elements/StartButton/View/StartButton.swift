//
//  StartButton.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

import UIKit

class StartButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)

    setupView()

    print("\(#function) \(bounds)")
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)

    setupView()

    print("\(#function) \(bounds)")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    print("\(#function) \(bounds)")
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    print("\(#function) \(bounds)")
  }

  private func setupView() {
    #warning("Setting up properties here")
  }

  func setup(with model: StartButtonViewModelType) {
    self.model = model

    setTitle(model.title, for: .normal)

    model.runtimeState.subscribe(self, closure: extractSelf { sSelf, data in
      #warning("remove this plug when data is ready")
      print("Countdown state did set to \(data.newValue ? "active" : "inactive")")
    })
  }

  private var model: StartButtonViewModelType?

  private var indicatorLayer: CAShapeLayer?
}
