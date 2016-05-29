//
//  UIControlConstants.swift
//  iTip
//
//  Created by hoaqt on 5/28/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import UIKit

import CircleSlider

class UIControlConstants {
    
    private init() {
        
    }
    
    static let ANIMATION_DURATION = 0.4

    static let CIRCLE_SLIDER_MAX_TIP_VALUE:Int = 50
    
    static let CIRCLE_SLIDER_MIN_TIP_VALUE:Int = 0
    
    static let CIRCLE_SLIDER_TRACKING_COLOR = UIColor(red: 78/255, green: 136/255, blue: 185/255, alpha: 1)
    
    static let CIRCLE_SLIDER_BAR_COLOR = UIColor(red: 198/255, green: 244/255, blue: 23/255, alpha: 0.2)
    
    static let CIRCLE_SLIDER_THUMB_COLOR = UIColor(red: 141/255, green: 185/255, blue: 204/255, alpha: 1)
    
    static let CIRCLE_SLIDER_BAR_WIDTH:CGFloat = 20
    
    static let CIRCLE_SLIDER_START_ANGLE:Double = -45
    
    static let CIRCLE_SLIDER_LABEL_FRAME = CGRect(x: 0, y: 0, width: 100, height: 100)
    
    
    static let CIRCLE_SLIDER_OPTIONS: [CircleSliderOption] = [
        .BarColor(CIRCLE_SLIDER_BAR_COLOR),
        .ThumbColor(CIRCLE_SLIDER_THUMB_COLOR),
        .TrackingColor(CIRCLE_SLIDER_TRACKING_COLOR),
        .BarWidth(CIRCLE_SLIDER_BAR_WIDTH),
        .StartAngle(CIRCLE_SLIDER_START_ANGLE),
        .MaxValue(Float(CIRCLE_SLIDER_MAX_TIP_VALUE)),
        .MinValue(Float(CIRCLE_SLIDER_MIN_TIP_VALUE)),
        ]

}
