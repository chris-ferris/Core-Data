// AppDelegate.swift
// Core Data
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  lazy var list = List()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let listController: ListController = {
      let controller = ListController()
      controller.container = list.container
      return controller
    }()
    window?.rootViewController = Library.navigationController(rootController: listController)
    window?.makeKeyAndVisible()
    return true
  }

  func applicationWillTerminate(_ application: UIApplication) {
    list.save()
  }
}
