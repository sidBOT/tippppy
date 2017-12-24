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
        effect = blurEffect.effect
        //blurEffect.effect = nil
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //effect = blurEffect.effect
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "index")
        tipController.selectedSegmentIndex = defaultTipIndex
        calculateTip(self)
        
    }
    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func valueChanged(_ sender: Any) {
        blurEffect.effect = self.effect
        calculateTip(self)
    }
    @IBAction func calculateTip(_ sender: Any) {
        blurEffect.effect = self.effect
        let tipPercentages = [0.18,0.2,0.25]
        if billField.text != "" {
            blurEffect.effect = self.effect
            let bill = Double(billField.text!)!
            let tip = bill * tipPercentages[tipController.selectedSegmentIndex]
            let total = bill + tip
            tipLabel.text = String(format: "%.2f", tip)
            totalLabel.text = String(format: "%.2f", total)
        }
        
    }
    
    
}

