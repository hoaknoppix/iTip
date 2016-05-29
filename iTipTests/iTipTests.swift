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
 
    func testMainViewCalculatingTotalAmount() {
        if #available(iOS 9.0, *) {
            let app = XCUIApplication()
            let orderCost = 10000
            let textBoxOrderCost = app.textFields["textBoxOrderCost"]
            textBoxOrderCost.tap()
            textBoxOrderCost.typeText(String(orderCost))
            XCTAssertEqual(textBoxOrderCost.label, String(orderCost), "Wrong input for textBoxOrderCost")
            let stringCurrentTipPercentage = app.staticTexts["labelTipPercentage"].label
            let currentTipPercentage = Int(stringCurrentTipPercentage.substringToIndex(stringCurrentTipPercentage.characters.endIndex))
            let totalCost = app.staticTexts["labelTotalCost"].label
                    XCTAssertEqual(totalCost, String(Utils.getTotalCost(Double(orderCost), tipPercentage: currentTipPercentage!)), "Wrong total cost")
        } else {
            // Fallback on earlier versions
        }
        
    }
    
}
