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

class ViewController: UIViewController {

    @IBOutlet weak var buttonCamera: UIButton!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var textBoxOrderCost: UITextField!
    @IBOutlet weak var labelTipPercentage: UILabel!
    var tipPercentage:Int = 5
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    
    @IBAction func editingChangeAction(sender: UITextField) {
        // I don't want to use currency format here since we must have another settings for selecting locale.
        calculateOrderCost()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //automatically show the keypad
        textBoxOrderCost.becomeFirstResponder()
    }
    
    override func viewDidAppear(animated: Bool) {
        loadTipPercentage()
        labelTipPercentage.text = "\(tipPercentage)%"
        calculateOrderCost()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    @IBAction func takePicture(sender: AnyObject) {
        guard (UIImagePickerController.isSourceTypeAvailable(.Camera)) else {
            self.view.makeToast("Camera doesn't exist")
            return
        }
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .Camera
        imagePicker.cameraCaptureMode = .Photo
        presentViewController(imagePicker, animated: true) { 

        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            textBoxOrderCost.text = Utils.getOrderCostFromImage(pickedImage)
        }
    }
    
}

extension ViewController {
    
    func calculateOrderCost() {
        let orderCost:Float = (textBoxOrderCost.text! as NSString).floatValue
        labelTotal.text = String(format:"%.2f",(Utils.getTotalCost(orderCost, tipPercentage: tipPercentage)))
    }
    
    func loadTipPercentage(){
        guard (Utils.retrieveTipPercentage() != nil) else {
            Utils.saveTipPercentage(tipPercentage)
            return
        }
        tipPercentage = Utils.retrieveTipPercentage()!
    }

}
