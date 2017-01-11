//
//  SettingsViewController.swift
//  TipCalculatorProper
//
//  Created by Poojan Dave on 1/10/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var customTipTextField: UITextField!
    @IBOutlet weak var defaultSegmentedControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
        
        customTipTextField.text = String(userDefaults.double(forKey: "customTip"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func DefaultTipChange(_ sender: Any) {
        
        userDefaults.set(defaultSegmentedControl.selectedSegmentIndex, forKey: "SettingsTipChoice")
    }
    
    @IBAction func customTipChanged(_ sender: Any) {
        
        let customTip = Double(customTipTextField.text!) ?? 0
        
        userDefaults.set(customTip, forKey: "customTip")
        
    }

}
