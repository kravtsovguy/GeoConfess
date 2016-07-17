//
//  ChoiceViewController.swift
//  GeoConfess
//
//  Created by Матвей Кравцов on 01.03.16.
//  Copyright © 2016 Andrei Costache. All rights reserved.
//

import UIKit

class ChoiceViewController: NavViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func firstPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_one", sender: self)
    }
    @IBAction func secondPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_one", sender: self)
    }
}
