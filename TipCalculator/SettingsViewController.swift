//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Yazan Arafeh on 12/8/19.
//  Copyright © 2019 Arafeh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get and set control to current default tip from UserDefaults
        defaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        // Set default tip and store in UserDefaults
        let defaultTip = defaultTipControl.selectedSegmentIndex
        defaults.set(defaultTip, forKey: "defaultTip")
        
        // Force UserDefaults to save
        defaults.synchronize()
    }
}
