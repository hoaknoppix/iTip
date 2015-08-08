//
//  Util.swift
//  iTip
//  Class Util
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import Foundation


class Util{
    
    static let _100_PERCENT:Float = 100;
    
    /// this method returns the total cost the user need to pay
    /// param: orderCost - the order cost
    /// param: tipPercentage - the percent of the order cost for tipping
    /// return: the total cost for paying
    static func getTotalCost(orderCost: Float, tipPercentage: Float) -> Float {
        let totalPercentage = tipPercentage + _100_PERCENT
        return orderCost * totalPercentage / _100_PERCENT
    }
}