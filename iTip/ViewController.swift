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
    @IBOutlet weak var textBoxTipPercentage: UITextField!
    @IBOutlet weak var textBoxOrderCost: UITextField!
    var tipPercentage:Float = 5;
    @IBAction func editingChangeAction(sender: UITextField) {
        // I don't want to use currency format here since we must have another settings for selecting locale.
        let orderCost:Float = (textBoxOrderCost.text! as NSString).floatValue
        tipPercentage  = (textBoxTipPercentage.text! as NSString).floatValue
        labelTotal.text = String(format:"%.2f",(Util.getTotalCost(orderCost, tipPercentage: tipPercentage)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTipPercentage()
        //automatically show the keypad
        textBoxOrderCost.becomeFirstResponder()
    }
    
    @IBAction func didFinishEditingTipPercentage(sender: AnyObject) {
        saveTipPercentage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadTipPercentage(){
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        tipPercentage = defaults.floatForKey("tip_percentage")
                print("\(tipPercentage)", terminator: "")
        if tipPercentage == 0 {
            tipPercentage = 5.0
        }
        textBoxTipPercentage.text = "\(tipPercentage)"
    }

    func saveTipPercentage(){
        let defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        tipPercentage  = (textBoxTipPercentage.text! as NSString).floatValue
        defaults.setFloat(tipPercentage, forKey: "tip_percentage")
        defaults.synchronize()
    }

}

