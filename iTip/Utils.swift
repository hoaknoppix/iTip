//
//  Util.swift
//  iTip
//  Class Util
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import Foundation
import TesseractOCR

class Utils{
    
    static let _100_PERCENT:Int = 100
    static var tipPercentage:Int? = nil
    static var tesseract:G8Tesseract = G8Tesseract(language: "eng")
    
    static func getOrderCostFromImage(image: UIImage) -> String {
        tesseract.charWhitelist = "1234567890"
        tesseract.image = image
        tesseract.recognize()
        print(tesseract.recognizedText)
        return tesseract.recognizedText
    }
    
    /// this method returns the total cost the user need to pay
    /// param: orderCost - the order cost
    /// param: tipPercentage - the percent of the order cost for tipping
    /// return: the total cost for paying
    static func getTotalCost(orderCost: Float, tipPercentage: Int) -> Float {
        let totalPercentage = tipPercentage + _100_PERCENT
        return orderCost * Float(totalPercentage) / Float(_100_PERCENT)
    }
    
    
    //this method retrieves the saved tip percentage
    //return: the saved tip percentage value
    static func retrieveTipPercentage() -> Int?{
        if (tipPercentage != nil) {
            return tipPercentage
        }
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.integerForKey("tip_percentage")
        return tipPercentage
    }
    
    //this method saves the current tip percentage as default
    // param: tipPercentage the current tip percentage
    static func saveTipPercentage(tipPercentage: Int){
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercentage, forKey: "tip_percentage")
        defaults.synchronize()
        self.tipPercentage = tipPercentage
    }

    
}