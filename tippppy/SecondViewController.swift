//
//  SecondViewController.swift
//  tippppy
//
//  Created by siddhant on 12/23/17.
//  Copyright © 2017 siddhant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var percentageSegment: UISegmentedControl!
    let vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if percentageSegment.selectedSegmentIndex == 0 {
            vc.option = 0
            
        }else if percentageSegment.selectedSegmentIndex == 1 {
            vc.option = 1
        }else {
            vc.option = 2
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
