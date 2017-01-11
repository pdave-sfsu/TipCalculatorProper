//
//  SettingsViewController.swift
//  TipCalculatorProper
//
//  Created by Poojan Dave on 1/10/17.
//  Copyright © 2017 Poojan Dave. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var DefaultSegmentedControl: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DefaultSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "SettingsTipChoice")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func DefaultTipChange(_ sender: Any) {
        
        userDefaults.set(DefaultSegmentedControl.selectedSegmentIndex, forKey: "SettingsTipChoice")
    }

}
