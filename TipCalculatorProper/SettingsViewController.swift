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

        // Do any additional setup after loading the view.
        
        DefaultSegmentedControl.selectedSegmentIndex = userDefaults.integer(forKey: "TipChoice")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DefaultTipChange(_ sender: Any) {
        
        userDefaults.set(DefaultSegmentedControl.selectedSegmentIndex, forKey: "TipChoice")
        
        userDefaults.set(DefaultSegmentedControl.selectedSegmentIndex, forKey: "MainChoice")
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
