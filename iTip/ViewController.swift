//
//  ViewController.swift
//  iTip
//
//  Created by hoaqt on 8/8/15.
//  Copyright (c) 2015 hoaqt. All rights reserved.
//

import UIKit
import TesseractOCR
import Toast_Swift
import ALCameraViewController

class ViewController: UIViewController {

    @IBOutlet weak var buttonCamera: UIButton!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var textBoxOrderCost: UITextField!
    @IBOutlet weak var labelTipPercentage: UILabel!
    
    var tipPercentage:Int = Constants.DEFAULT_TIP_PERCENTAGE
    let croppingEnabled = true

    override func viewDidLoad() {
        super.viewDidLoad()
        //automatically show the keypad
        textBoxOrderCost.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        UIUtils.fadeIn(self.view)
        loadTipPercentage()
        labelTipPercentage.text = "\(tipPercentage)%"
        calculateOrderCost()
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIUtils.fadeOut(self.view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController {
    @IBAction func editingChangeAction(sender: UITextField) {
        // I don't want to use currency format here since we must have another settings for selecting locale.
        calculateOrderCost()
    }
}

extension ViewController {
    @IBAction func takePicture(sender: AnyObject) {
        guard (UIImagePickerController.isSourceTypeAvailable(.Camera)) else {
            self.view.makeToast(Constants.STRING_CAMERA_NOT_EXIST)
            return
        }
        let cameraViewController = CameraViewController(croppingEnabled: croppingEnabled) { image, asset in
            if let pickedImage: UIImage = image! {
                self.textBoxOrderCost.text = Utils.getOrderCostFromImage(pickedImage)
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        cameraViewController.modalTransitionStyle = .FlipHorizontal
        cameraViewController.supportedInterfaceOrientations()
        
        presentViewController(cameraViewController, animated: true, completion: nil)
    }
}

extension ViewController {
    func calculateOrderCost() {
        let orderCost:Double = (textBoxOrderCost.text! as NSString).doubleValue
        let totalCost = Utils.getTotalCost(orderCost, tipPercentage: tipPercentage)
        labelTotal.text = NumberFormatterUtils.getCurrencyStyleStringFromDouble(totalCost)
    }
    
    func loadTipPercentage(){
        guard (Utils.retrieveTipPercentage() != nil) else {
            Utils.saveTipPercentage(tipPercentage)
            return
        }
        tipPercentage = Utils.retrieveTipPercentage()!
    }
}
