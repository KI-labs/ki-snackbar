//
//  KISnackBarTests.swift
//  KISnackBarTests
//
//  Created by Emre Cakirlar on 29.08.18.
//  Copyright © 2018 KI labs. All rights reserved.
//

import XCTest
//@testable import KISnackBar

class KISnackBarTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        KISnackBar.shared.show(title: "")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
