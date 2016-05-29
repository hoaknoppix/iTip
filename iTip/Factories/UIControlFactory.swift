//
//  UIControlFactory.swift
//  iTip
//
//  Created by hoaqt on 5/28/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import UIKit
import CircleSlider

class UIControlFactory {
    
    static func createCircleSlider(sliderArea: UIView) -> CircleSlider {
        let circleSlider = CircleSlider(frame: sliderArea.bounds, options: UIControlConstants.CIRCLE_SLIDER_OPTIONS)
        let valueLabel = createCenterLabelForCircleSlider(UIControlConstants.CIRCLE_SLIDER_LABEL_FRAME, circleSlider: circleSlider, textAlignment: NSTextAlignment.Center)
        circleSlider.addSubview(valueLabel)
        return circleSlider
    }
    
    static func createCenterLabelForCircleSlider(frame: CGRect, circleSlider: CircleSlider, textAlignment: NSTextAlignment) -> UILabel {
        let valueLabel = UILabel(frame: frame)
        valueLabel.textAlignment = textAlignment
        valueLabel.center = CGPoint(x: CGRectGetWidth(circleSlider.bounds) * 0.5, y: CGRectGetHeight(circleSlider.bounds) * 0.5)
        return valueLabel
    }

}
