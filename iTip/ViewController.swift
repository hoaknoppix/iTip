//
//  ViewController.swift
//  iTip
//
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var textBoxOrderCost: UITextField!
    @IBOutlet weak var labelTipPercentage: UILabel!
    var tipPercentage:Int = 5
    
    @IBAction func editingChangeAction(sender: UITextField) {
        // I don't want to use currency format here since we must have another settings for selecting locale.
        let orderCost:Float = (textBoxOrderCost.text! as NSString).floatValue
        labelTotal.text = String(format:"%.2f",(Utils.getTotalCost(orderCost, tipPercentage: tipPercentage)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //automatically show the keypad
        textBoxOrderCost.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadTipPercentage()
        labelTipPercentage.text = "\(tipPercentage)%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadTipPercentage(){
        guard (Utils.retrieveTipPercentage() == nil) else {
            Utils.saveTipPercentage(tipPercentage)
            return
        }
        tipPercentage = Utils.retrieveTipPercentage()!
    }

    func saveTipPercentage(){
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        tipPercentage  = (textBoxTipPercentage.text! as NSString).floatValue
        defaults.setInteger(tipPercentage, forKey: "tip_percentage")
        defaults.synchronize()
    }

}

