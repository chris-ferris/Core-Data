// Core_DataTests.swift
// Core DataTests
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import XCTest
@testable import Core_Data

class Core_DataTests: XCTestCase {
  override func setUp() {
    super.setUp()

  }

  override func tearDown() {

    super.tearDown()
  }


  func testContainer() {
    let list = List()
    XCTAssertNotNil(list.container, "NSPersistentContainer is nil")
  }
}
