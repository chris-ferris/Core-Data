// ListController.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit
import CoreData

class ListController: UIViewController, UITableViewDataSource, UITableViewDelegate, ItemControllerDelegate {
  var container: NSPersistentContainer!
  var itemArray: [Item] = []
  let listView = ListView()

  override func loadView() {
    super.loadView()
    title = "Core Data"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonTapped))
    view = listView
    listView.listTable.dataSource = self
    listView.listTable.delegate = self
    guard container != nil else {
      //!
      fatalError("NSPersistentContainer is nil")
    }

    let request = NSFetchRequest<Item>(entityName: "Item")
    do {
      itemArray = try container.viewContext.fetch(request)
    } catch let error as NSError {
      //!
      print(error.userInfo)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    listView.listTable.reloadData()
  }

  @objc func addBarButtonTapped() {
    let itemController = ItemController()
    itemController.delegate = self
    present(Library.navigationController(rootController: itemController), animated: true, completion: nil) //
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let tableViewCell = Library.tableViewCell(style: .default, identifier: nil)
    tableViewCell.textLabel?.text = itemArray[indexPath.row].name
    return tableViewCell
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      let context = container.viewContext
      let itemToDelete = itemArray[indexPath.row]
      context.delete(itemToDelete)
      do {
        try context.save()
        itemArray.remove(at: indexPath.row)
      } catch let error as NSError {
        print(error.userInfo)
      }
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }

  func done(itemName: String) {
    let context = container.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)!
    let item = Item(entity: entity, insertInto: context)
    item.setValue(itemName, forKeyPath: "name")
    do {
      try context.save()
      itemArray.append(item)
    } catch let error as NSError {
      print(error.userInfo)
    }
  }

  func alert(title: String?, message: String?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    self.present(alertController, animated: true, completion: nil)
  }
}
