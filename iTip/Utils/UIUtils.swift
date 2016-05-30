//
//  UIUtils.swift
//  iTip
//
//  Created by hoaqt on 5/28/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import UIKit

class UIUtils {
    private init(){
        
    }

    static func fadeIn(view:UIView) {
        view.alpha = Constants.FADE_MIN_VALUE
        UIView.animateWithDuration(UIControlConstants.ANIMATION_DURATION) {
            view.alpha = Constants.FADE_MAX_VALUE
        }
    }
    
    static func fadeOut(view:UIView) {
        view.alpha = Constants.FADE_MAX_VALUE
        UIView.animateWithDuration(UIControlConstants.ANIMATION_DURATION) {
            view.alpha = Constants.FADE_MIN_VALUE
        }
    }
}
