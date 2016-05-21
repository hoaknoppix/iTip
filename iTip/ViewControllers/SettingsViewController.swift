//
//  SettingsViewController.swift
//  iTip
//
//  Created by Hoa Tran on 5/19/16.
//  Copyright © 2016 hoaqt. All rights reserved.
//

import UIKit
import CircleSlider


class SettingsViewController: UIViewController {

    @IBOutlet weak var sliderArea: UIView!
    
    private var valueLabel: UILabel!
    
    private let MAX_TIP_VALUE:Int = 50
    
    private let THRESHOLD_TIP_VALUE:Int = 25
    
    private let MIN_TIP_VALUE:Int = 0
    
    private var trackingColor = UIColor(red: 78/255, green: 136/255, blue: 185/255, alpha: 1)
    
    private var isCircleSliderLoaded = false
    

    private var circleSlider: CircleSlider! {
        didSet {
            self.circleSlider.tag = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let options: [CircleSliderOption] = [
            .BarColor(UIColor(red: 198/255, green: 244/255, blue: 23/255, alpha: 0.2)),
            .ThumbColor(UIColor(red: 141/255, green: 185/255, blue: 204/255, alpha: 1)),
            .TrackingColor(trackingColor),
            .BarWidth(20),
            .StartAngle(-45),
            .MaxValue(Float(MAX_TIP_VALUE)),
            .MinValue(Float(MIN_TIP_VALUE))
        ]
        self.circleSlider = CircleSlider(frame: self.sliderArea.bounds, options: options)
        self.circleSlider?.addTarget(self, action: #selector(SettingsViewController.valueChange(_:)), forControlEvents: .ValueChanged)
        self.sliderArea.addSubview(self.circleSlider)
        self.valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.valueLabel.textAlignment = .Center
        self.valueLabel.center = CGPoint(x: CGRectGetWidth(self.circleSlider.bounds) * 0.5, y: CGRectGetHeight(self.circleSlider.bounds) * 0.5)
        self.circleSlider.addSubview(self.valueLabel)
        self.circleSlider.value = Float(Utils.retrieveTipPercentage()!)
        isCircleSliderLoaded = true
    }
    
    func valueChange(sender: CircleSlider) {
        guard isCircleSliderLoaded else {
            return
        }
        let value:Int = Int(sender.value)
        self.valueLabel.text = "\(value)" + "%"
        Utils.saveTipPercentage(value)
        
        switch (value / THRESHOLD_TIP_VALUE) {
        case 0:
            self.circleSlider.changeOptions([.TrackingColor(UIColor(red: 78/255, green: 136/255, blue: 185/255, alpha: 1))])
            break
        case 1:
            self.circleSlider.changeOptions([.TrackingColor(UIColor(red: 150/255, green: 50/255, blue: 120/255, alpha: 1))])
            break
        default:
            break
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
