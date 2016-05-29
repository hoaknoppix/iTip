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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let circleSlider = UIControlFactory.createCircleSlider(self.sliderArea)
        circleSlider.addTarget(self, action: #selector(SettingsViewController.valueChange(_:)), forControlEvents: .ValueChanged)
        self.sliderArea.addSubview(circleSlider)
        circleSlider.value = Float(Utils.retrieveTipPercentage()!)
    }
    
    func valueChange(sender: CircleSlider) {
        let value:Int = Int(sender.value)
        sender.valueLabel!.text = "\(value)" + "%"
        Utils.saveTipPercentage(value)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
