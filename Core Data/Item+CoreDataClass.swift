// Item+CoreDataClass.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import CoreData

@objc(Item)
public class Item: NSManagedObject {
  @NSManaged public var name: String?

  @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
    return NSFetchRequest<Item>(entityName: "Item")
  }
}
