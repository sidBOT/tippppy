//
//  ViewController.swift
//  tippppy
//
//  Created by siddhant on 12/21/17.
//  Copyright © 2017 siddhant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    var effect: UIVisualEffect!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "index")
        tipController.selectedSegmentIndex = defaultTipIndex
        calculateTip(self)
        
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func valueChanged(_ sender: Any) {
        calculateTip(self)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.18,0.2,0.25]
        if billField.text == "" {
            tipLabel.text = "$0.00"
            totalLabel.text = "$0.00"
        }
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        
    }
    
    
}

