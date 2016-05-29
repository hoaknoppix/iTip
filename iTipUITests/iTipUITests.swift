//
//  iTipUITests.swift
//  iTipUITests
//
//  Created by hoaqt on 5/29/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import XCTest

class iTipUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testMainViewCalculatingTotalAmount() {
        let app = XCUIApplication()
        let orderCost:Double = 10000
        let textBoxOrderCost = app.textFields["textBoxOrderCost"]
        textBoxOrderCost.tap()
        textBoxOrderCost.typeText(String(orderCost))
        let actualOrderCost = Double(textBoxOrderCost.value as! String)
        XCTAssertEqual(actualOrderCost, orderCost, "Wrong input for textBoxOrderCost")
        let stringCurrentTipPercentage = app.staticTexts["labelTipPercentage"].label
        let currentTipPercentage = Int(stringCurrentTipPercentage.substringToIndex(stringCurrentTipPercentage.characters.endIndex.advancedBy(-1)))!
        let totalCost = app.staticTexts["labelTotalCost"].label
        //the Utils class doesn't work caused by tesseract
        let totalPercentage = currentTipPercentage + 100
        let expectedTotalCost = Double(orderCost) * Double(totalPercentage) / Double(100)
        //
        XCTAssertEqual(totalCost, NumberFormatterUtils.getCurrencyStyleStringFromDouble(expectedTotalCost), "Wrong total cost")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
