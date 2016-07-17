//
//  LoginViewController.swift
//  GeoConfess
//
//  Created by Матвей Кравцов on 01.03.16.
//  Copyright © 2016 Andrei Costache. All rights reserved.
//

import UIKit

class LoginViewController: NavViewController {
    
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIco: UIImageView!
    @IBOutlet weak var passwordIco: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginText.delegate = self
        passwordText.delegate = self
        
    }
    
    let selectedColor = UIColor(red: 237/255, green: 95/255, blue: 83/255, alpha: 50/100)
    @IBAction func usernameEditingBegin(sender: AnyObject) {
        
        view1.backgroundColor = selectedColor
        view2.backgroundColor = UIColor.clearColor()
        
        loginText.textColor = UIColor.whiteColor()
        passwordText.textColor = UIColor.blackColor()
        
        loginText.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        passwordText.setValue(UIColor.lightGrayColor(), forKeyPath: "_placeholderLabel.textColor")
        
        loginIco.image = UIImage(named: "icone-identifiant-on")
        passwordIco.image = UIImage(named: "icone-mot-de-passe-off")
        
    }
    @IBAction func passwordEditingBegin(sender: AnyObject) {
        
        view1.backgroundColor = UIColor.clearColor()
        view2.backgroundColor = selectedColor
        
        loginText.textColor = UIColor.blackColor()
        passwordText.textColor = UIColor.whiteColor()
        
        loginText.setValue(UIColor.lightGrayColor(), forKeyPath: "_placeholderLabel.textColor")
        passwordText.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        
        loginIco.image = UIImage(named: "icone-identifiant-off")
        passwordIco.image = UIImage(named: "icone-mot-de-passe-on")
        
    }

    @IBAction func loginPressed(sender: AnyObject) {
        loginButton.enabled = false
        // "admin@example.com"
        // "1q2w3e4r"
        APICalls.login(loginText.text ?? "", password: passwordText.text ?? "", onCompletion: { (ok) -> Void in
                JLToast.makeText("Everything is ok", duration: JLToastDelay.LongDelay).show()
                self.performSegueWithIdentifier("goto_main", sender: self)
            }) { (err) -> Void in
                JLToast.makeText(err, duration: JLToastDelay.LongDelay).show()
                self.loginButton.enabled = true
        }
    }
    @IBAction func signupPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("goto_signup", sender: self)
    }
}
