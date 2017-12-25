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
    let defaults = UserDefaults.standard
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    @IBOutlet weak var previousLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaultTipIndex = defaults.integer(forKey: "index")
        tipController.selectedSegmentIndex = defaultTipIndex
        let tip = defaults.double(forKey: "tip")
        let total = defaults.double(forKey: "total")
        let bill = defaults.integer(forKey: "bill")
        totalLabel.text = String(format: "$%.2f", total)
        tipLabel.text = String(format: "$%.2f", tip)
        billField.text = String(format: "%d", bill)
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
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        defaults.set(tip, forKey: "tip")
        defaults.set(total, forKey: "total")
        if billField.text != "" {
            defaults.set(bill, forKey: "bill")
        }
        defaults.synchronize()
        
        
        
    }
    
    
}

