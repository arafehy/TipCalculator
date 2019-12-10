//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yazan Arafeh on 12/8/19.
//  Copyright © 2019 Arafeh. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set number format to use grouping separator and currency style
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        
        // Use locale specific currency
        tipLabel.text = currencyFormatter.string(from: 0)
        totalLabel.text = currencyFormatter.string(from: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Get and set control to current default tip from UserDefaults
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
        
        // Make the keyboard appear automatically and is the first responder
        billField.becomeFirstResponder()
        
        // Get current locale
        currencyFormatter.locale = Locale.autoupdatingCurrent
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
}
