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
        let orderCost:Float = (textBoxOrderCost.text as NSString).floatValue
        tipPercentage  = (textBoxTipPercentage.text as NSString).floatValue
        labelTotal.text = String(format:"%.2f",(Util.getTotalCost(orderCost, tipPercentage: tipPercentage)))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //automatically show the keypad
        textBoxOrderCost.becomeFirstResponder()

        loadTipPercentage()
    }

    override func viewWillDisappear(animated: Bool) {

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //don't know why it didn't work
    func loadTipPercentage(){
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var defaultTipObject = defaults.objectForKey("tip")
        tipPercentage = defaults.floatForKey("tip_percentage")
        print(tipPercentage)
        textBoxTipPercentage.text = tipPercentage.description
    }

    func saveTipPercentage(){
        var defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("Tip", forKey: "tip")
        defaults.setFloat(tipPercentage, forKey: "tip_percentage")
        defaults.synchronize()
    }

}

