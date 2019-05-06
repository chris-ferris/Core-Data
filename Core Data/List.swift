// List.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import CoreData

class List: NSObject {
  var container = NSPersistentContainer(name: "Core_Data")

  override init() {
    super.init()

    // Typical reasons for an error:
    // * Parent directory does not exist, cannot be created, or disallows writing
    // * Persistent store is not accessible, due to permissions or data protection when the device is locked
    // * Device is out of space
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        //!
        fatalError("Failed to load Core Data stack: \(error), \(error.userInfo)")
      }
    })
  }

  func save() {
    let context = container.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        //!
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
