//
//  ViewController.swift
//  Prework
//
//  Created by NYUAD on 9/5/21.
//  Copyright © 2021 NYUAD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var total = 0.0
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var partycounter: UILabel!
    
    @IBOutlet weak var equalsto: UILabel!
    @IBOutlet weak var pplabel: UILabel!
    @IBOutlet weak var Tip: UILabel!
    @IBOutlet weak var partylabel: UILabel!
    @IBOutlet weak var cnt: UIStepper!
    
    override func viewDidLoad() {
        self.title = "Tipit"
        let defaults = UserDefaults.standard
        defaults.set(15, forKey: "Tip1")
        defaults.set(18, forKey: "Tip2")
        defaults.set(20, forKey: "Tip3")
        defaults.set(0, forKey: "DM")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Seen")
        let defaults = UserDefaults.standard
        let Tip1 = defaults.string(forKey: "Tip1")
        let Tip2 = defaults.string(forKey: "Tip2")
        let Tip3 = defaults.string(forKey: "Tip3")
        
        let dm = defaults.string(forKey: "DM")
        
        if(Int(dm!) == 1){
            self.view.backgroundColor = UIColor.black
            Tip.textColor = UIColor.white
            partylabel.textColor = UIColor.white
            equalsto.textColor = UIColor.white
            pplabel.textColor = UIColor.white
        billAmountTextField.textColor = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            partycounter.textColor = UIColor.white
            totalLabel.textColor = UIColor.white
            counter.textColor = UIColor.white
            tipControl.backgroundColor = UIColor.gray
            cnt.backgroundColor = UIColor.gray
        }
        if (Int(dm!)==0){
            self.view.backgroundColor = UIColor.white
            Tip.textColor = UIColor.black
                partylabel.textColor = UIColor.black
                equalsto.textColor = UIColor.black
                pplabel.textColor = UIColor.black
        billAmountTextField.textColor = UIColor.darkGray
            tipAmountLabel.textColor = UIColor.black
                partycounter.textColor = UIColor.black
                totalLabel.textColor = UIColor.darkGray
                counter.textColor = UIColor.black
            tipControl.backgroundColor = UIColor.lightGray
            cnt.backgroundColor = UIColor.lightGray
        }
        tipControl.setTitle(String(Tip1!), forSegmentAt: 0)
        
        tipControl.setTitle(String(Tip2!), forSegmentAt: 1)
        
        tipControl.setTitle(String(Tip3!), forSegmentAt: 2)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get Bill Amount from Text Field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func stepchange(_ sender: Any) {
        let val = cnt.value
        counter.text = String(Int(val))
        let pp = total/val
        partycounter.text = String(format: "$%.2f",pp)
    }
   
    
}

