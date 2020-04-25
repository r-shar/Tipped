//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Rashmi Sharma.
//  Copyright © 2020 Rashmi Sharma. All rights reserved.
//

// Simple tip calculator


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmt: UILabel!
    @IBOutlet weak var totalAmt: UILabel!
    @IBOutlet weak var billAmt: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        totalView.isHidden = true
        
    }

    // dismiss keyboard when main screen is tapped
    @IBAction func tapMainScreen(_ sender: Any) {
        view.endEditing(true)
        
        UIView.animate(withDuration: 1.0, animations: {
            self.totalView.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 240.0); self.totalView.isHidden = true; self.billAmt.text = nil
        }, completion: nil)
        
        
    }
    
    // initiated whenever value inside text field is updated
    @IBAction func calcTip(_ sender: Any) {
        
        // todo:
        // 1. Run function when typing value of bill, store value of the bill
        // 2. calculate tip
        // 3. update tipAmtLabel and totalAmtLabel
        
        
        let bill = Double(billAmt.text!) ?? 0 // if no value in field, set bill to 0
        
        let tipPercent = [0.1, 0.15, 0.18, 0.2]
        
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmt.text = String(format: "$%0.2f", tip)
        totalAmt.text = String(format: "$%0.2f", total
        )
        
        // animate total bill area
        totalView.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.totalView.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: -240.0)
        }, completion: nil)
    }

}

