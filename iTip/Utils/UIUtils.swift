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
        view.alpha = 0.5
        UIView.animateWithDuration(UIControlConstants.ANIMATION_DURATION) {
            view.alpha = 1
        }
    }
    
    static func fadeOut(view:UIView) {
        view.alpha = 1
        UIView.animateWithDuration(UIControlConstants.ANIMATION_DURATION) {
            view.alpha = 0.5
        }
    }
}
