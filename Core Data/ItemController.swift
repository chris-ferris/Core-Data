// ItemController.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

protocol ItemControllerDelegate: class {
  func done(itemName: String)
  func alert(title: String?, message: String?)
}

class ItemController: UIViewController, UITextFieldDelegate {
  weak var delegate: ItemControllerDelegate?
  let itemView = ItemView()

  override func loadView() {
    super.loadView()
    title = "Add Item"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonTapped))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonTapped))
    view = itemView
    itemView.itemField.delegate = self
  }

  @objc func cancelBarButtonTapped() {
    itemView.itemField.resignFirstResponder()
    dismissSelf()
  }

  @objc func doneBarButtonTapped() {
    if let name = itemView.itemField.text, name != "" {
      delegate?.done(itemName: name)
      itemView.itemField.resignFirstResponder()
    }
    dismissSelf()
  }

  func dismissSelf() {
    self.dismiss(animated: true, completion: nil)
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }
}
