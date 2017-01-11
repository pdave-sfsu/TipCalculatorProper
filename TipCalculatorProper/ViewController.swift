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
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var personSegmentedControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
        
        personSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsPersonChoice")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
        
        personSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsPersonChoice")
            
        calculateTip(true as AnyObject)
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.motionShake {
            tipControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
            
            personSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsPersonChoice")
            
            billTextField.text = ""
            
            calculateTip(true as AnyObject)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func OnTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.25, 0.0]
        
        tipPercentages[3] = userDefaults.double(forKey: "customTip") / 100
        
        var personChoices = [1, 2, 3, 1]
        
        personChoices[3] = userDefaults.integer(forKey: "customPerson")
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        var numOfPeople = Double(personChoices[personSegmentedControl.selectedSegmentIndex])
        
        if (numOfPeople < 1) {
            numOfPeople = 1
            userDefaults.set(1, forKey: "customPerson")
        }
        
        let perPerson = total / numOfPeople
        
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        
        totalLabel.text = formatter.string(from: NSNumber(value: total))
        perPersonLabel.text = formatter.string(from: NSNumber(value: perPerson))
        
    }

}

