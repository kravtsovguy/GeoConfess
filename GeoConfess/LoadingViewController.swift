//
//  ViewController.swift
//  GeoConfess
//
//  Created by Admin on 2/26/16.
//  Copyright © 2016 Andrei Costache. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var loadingProgress: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadingProgress.hidden = false;
        loadingProgress.hidesWhenStopped = true;
        loadingProgress.startAnimating();
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "didFinishLoading", userInfo: nil, repeats: false);
    }
    
    func didFinishLoading() {
        loadingProgress.stopAnimating();
        self.performSegueWithIdentifier("goto_home", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

