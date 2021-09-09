//
//  SettingsViewController.swift
//  Prework
//
//  Created by NYUAD on 9/6/21.
//  Copyright © 2021 NYUAD. All rights reserved.
//

import UIKit

class
SettingsViewController: UIViewController {
    
    @IBOutlet weak var sdt: UILabel!
    @IBOutlet weak var tip1label: UILabel!
    @IBOutlet weak var tip2label: UILabel!
    @IBOutlet weak var tip3label: UILabel!
    @IBOutlet weak var dml: UILabel!
    
    @IBOutlet weak var Tip1: UITextField!
    @IBOutlet weak var Tip2: UITextField!
   
    @IBOutlet weak var Tip3: UITextField!
    @IBOutlet weak var btn: UISwitch!
    var main:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
               let t1 = defaults.string(forKey: "Tip1")
               let t2 = defaults.string(forKey: "Tip2")
               let t3 = defaults.string(forKey: "Tip3")
        let dm = defaults.string(forKey: "DM")
        
        Tip1.text = t1
        Tip2.text = t2
        Tip3.text = t3
        
        if (Int(dm!)==1){
            btn.isOn = true
            self.view.backgroundColor = UIColor.black
            tip1label.textColor = UIColor.white
            tip2label.textColor = UIColor.white
            tip3label.textColor = UIColor.white
            sdt.textColor = UIColor.white
            dml.textColor = UIColor.white
        }
        if (Int(dm!)==0){
            btn.isOn = false
            self.view.backgroundColor = UIColor.white
            tip1label.textColor = UIColor.black
            tip2label.textColor = UIColor.black
            tip3label.textColor = UIColor.black
            sdt.textColor = UIColor.black
            dml.textColor = UIColor.black
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        let tip1 = Tip1.text
        let tip2 = Tip2.text
        let tip3 = Tip3.text
        
        let defaults = UserDefaults.standard
        defaults.set(tip1!, forKey: "Tip1")
        defaults.set(tip2!, forKey: "Tip2")
        defaults.set(tip3!, forKey: "Tip3")
        defaults.synchronize()
    }
    @IBAction func Darkmode(_ sender: Any) {
        let defaults = UserDefaults.standard
        if(btn.isOn){
            self.view.backgroundColor = UIColor.black
            defaults.set(1, forKey: "DM")
            defaults.synchronize()
            tip1label.textColor = UIColor.white
            tip2label.textColor = UIColor.white
            tip3label.textColor = UIColor.white
            sdt.textColor = UIColor.white
            dml.textColor = UIColor.white
        }else{
            self.view.backgroundColor = UIColor.white
            defaults.set(0, forKey: "DM")
            defaults.synchronize()
            tip1label.textColor = UIColor.black
            tip2label.textColor = UIColor.black
            tip3label.textColor = UIColor.black
            sdt.textColor = UIColor.black
            dml.textColor = UIColor.black
        }
        
    }
    
}
