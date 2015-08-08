//
//  iTipTests.swift
//  iTipTests
//
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import UIKit
import XCTest
import iTip

class iTipTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //Have tried, but I don't know it cannot reach Util class :(
    /*
    func testGetTotalValue(){
        let orderCost = 1000.00;
        let tipPercentage = 10;
        let total = Util.getTotalCost(orderCost, tipPercentage)
        XCTAssertEqual(1100.00, Util.getTotalCost(orderCost, tipPercentage), "The caculation is not correct.")
    }
    */
    
    func testExample() {
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        self.measureBlock() {
        }
    }
    
}
