//
//  iTipTests.swift
//  iTipTests
//
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import XCTest

class iTipTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetTotalValue(){
        let orderCost = 1000.00
        let tipPercentage = 10
        XCTAssertEqual(1100.00, Utils.getTotalCost(orderCost, tipPercentage: tipPercentage), "The caculation is not correct.")
    }
    
    func testSetAndGetTipPercentageFromNSDefault() {
        let tipPercentage = 20
        Utils.saveTipPercentage(tipPercentage)
        XCTAssertEqual(tipPercentage,Utils.retrieveTipPercentage(), "Cannot set and get tip percentage from NSDefault")
    }
    
}
