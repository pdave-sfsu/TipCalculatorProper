//
//  SettingsViewController.swift
//  TipCalculatorProper
//
//  Created by Poojan Dave on 1/10/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var customPersonTextField: UITextField!
    @IBOutlet weak var defaultPersonSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var defaultSegmentedControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
        
        customTipTextField.text = String(userDefaults.double(forKey: "customTip"))
        
        defaultPersonSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsPersonChoice")
        
        customPersonTextField.text = String(userDefaults.double(forKey: "customPerson"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
        
    }
    
    @IBAction func DefaultTipChange(_ sender: Any) {
        
        userDefaults.set(defaultSegmentedControl.selectedSegmentIndex, forKey: "SettingsTipChoice")
    }
    
    @IBAction func customTipChanged(_ sender: Any) {
        
        let customTip = Double(customTipTextField.text!) ?? 0
        
        userDefaults.set(customTip, forKey: "customTip")
        
    }

    @IBAction func defaultPersonChanged(_ sender: Any) {
        
        userDefaults.set(defaultPersonSegmentedControl.selectedSegmentIndex, forKey: "SettingsPersonChoice")
        
    }
    
    @IBAction func customPersonChange(_ sender: Any) {
        
        var customPerson = Double(customPersonTextField.text!) ?? 1
        
        if customPerson < 1 {
            customPerson = 1
        }
    
        userDefaults.set(customPerson, forKey: "customPerson")
        
    }
    
}
