//
//  NumberFormatterUtils.swift
//  iTip
//
//  Created by hoaqt on 5/30/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import UIKit

class NumberFormatterUtils {
    
    static let numberFormatter = NSNumberFormatter()
    
    static func initNumberFormatterAsCurrencyStyle() {
        numberFormatter.locale = NSLocale(localeIdentifier: Constants.DEFAULT_LOCALE)
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        numberFormatter.minimumFractionDigits = Constants.DEFAULT_MINIMUM_FRACTION_DIGITS
    }
    //this method is for formatting double as currency style
    static func getCurrencyStyleStringFromDouble(value: Double) -> String {
        initNumberFormatterAsCurrencyStyle()
        return numberFormatter.stringFromNumber(NSNumber(double: value))!
    }
    
    //this method is for getting double from currency style string
    static func getDoubleFromCurrencyStyle(value: String) -> Double {
        initNumberFormatterAsCurrencyStyle()
        return numberFormatter.numberFromString(value)!.doubleValue
    }


}
