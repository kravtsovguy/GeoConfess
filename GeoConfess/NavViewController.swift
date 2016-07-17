//
//  NavViewController.swift
//  KILLFISH
//
//  Created by Матвей Кравцов on 31.01.16.
//  Copyright © 2016 Матвей Кравцов. All rights reserved.
//

import UIKit

class NavViewController: UIViewController, UITextFieldDelegate {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBarTitle()
    }
    
    static var isTitleSet = false
    
    func setupBarTitle(){
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        
        if NavViewController.isTitleSet {
            return
        }
        
        let logo = UIImage(named: "geoconfess-blanc")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: 20))
        imageView.contentMode = .ScaleAspectFit
        imageView.image = logo
        
        self.navigationController?.view.addSubview(imageView)
        NavViewController.isTitleSet = true

        //self.navigationItem.titleView = imageView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var kbHeight: CGFloat!
    
    var kVisible = false
    

    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if kVisible {return}
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                kbHeight = keyboardSize.height/2
                self.animateTextField(true)
            }
        }
        kVisible=true
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
        kVisible=false
    }
    
    func animateTextField(up: Bool) {
        /*let movement = (up ? -kbHeight : kbHeight)

        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
        */
    }

}
