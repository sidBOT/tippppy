//
//  SecondViewController.swift
//  tippppy
//
//  Created by siddhant on 12/23/17.
//  Copyright © 2017 siddhant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tipSelector: UISegmentedControl!
    let vc = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "index")
        tipSelector.selectedSegmentIndex = defaultTipIndex
    }

    @IBAction func onChange(_ sender: Any) {
        let changedDefaultTip = tipSelector.selectedSegmentIndex;
        let defaults = UserDefaults.standard
        defaults.set(changedDefaultTip, forKey: "index")
        defaults.synchronize()
        
    }
   
   
}
