// ListView.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

class ListView: UIView {
  let listTable = Library.tableView()

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

    self.addSubview(listTable)
    NSLayoutConstraint.activate([
      listTable.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: Library.marginSmall),
      listTable.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -Library.marginSmall),
      listTable.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
      listTable.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor)])
  }
}
