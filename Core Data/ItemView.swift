// ItemView.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

class ItemView: UIView {
  let itemField: UITextField = {
    let textField = Library.textField()
    textField.returnKeyType = .done
    textField.placeholder = "Item"
    return textField
  }()

  convenience init() {
    self.init(frame: .zero)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialize()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initialize()
  }

  func initialize() {
    self.backgroundColor = Library.backgroundColor
    let layoutGuide = UILayoutGuide()
    self.addLayoutGuide(layoutGuide)
    let margins = self.layoutMarginsGuide
    NSLayoutConstraint.activate([
      layoutGuide.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
      layoutGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
      layoutGuide.topAnchor.constraint(equalTo: margins.topAnchor, constant: Library.marginSmall),
      layoutGuide.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -Library.marginLarge)])

    self.addSubview(itemField)
    NSLayoutConstraint.activate([
      itemField.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: Library.marginLarge),
      itemField.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -Library.marginLarge),
      itemField.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: Library.marginLarge)])
  }
}
