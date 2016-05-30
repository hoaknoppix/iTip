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
    
    struct UtilsConstants {

    }
    
    private init() {
        
    }
    
    static var tipPercentage:Int? = nil
    static var tesseract:G8Tesseract = G8Tesseract(language: Constants.DEFAULT_OCR_LANGUAGE)
    
    static func getOrderCostFromImage(image: UIImage) -> String {
        tesseract.charWhitelist = Constants.DIGITS
        tesseract.image = image
        tesseract.recognize()
        return tesseract.recognizedText
    }
    
    /// this method returns the total cost the user need to pay
    /// param: orderCost - the order cost
    /// param: tipPercentage - the percent of the order cost for tipping
    /// return: the total cost for paying
    static func getTotalCost(orderCost: Double, tipPercentage: Int) -> Double {
        let totalPercentage = tipPercentage + Constants._100_PERCENT
        return orderCost * Double(totalPercentage) / Double(Constants._100_PERCENT)
    }
    
    
    //this method retrieves the saved tip percentage
    //return: the saved tip percentage value
    static func retrieveTipPercentage() -> Int?{
        if (tipPercentage != nil) {
            return tipPercentage
        }
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.integerForKey(Constants.KEY_TIP_PERCENTAGE)
        return tipPercentage
    }
    
    //this method saves the current tip percentage as default
    // param: tipPercentage the current tip percentage
    static func saveTipPercentage(tipPercentage: Int){
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercentage, forKey: Constants.KEY_TIP_PERCENTAGE)
        defaults.synchronize()
        self.tipPercentage = tipPercentage
    }
    
    
    
}