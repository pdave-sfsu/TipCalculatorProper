//
//  ViewController.swift
//  TipCalculatorProper
//
//  Created by Poojan Dave on 1/4/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
            
        calculateTip(true as AnyObject)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func OnTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        
        totalLabel.text = formatter.string(from: NSNumber(value: total))
        
    }

}

