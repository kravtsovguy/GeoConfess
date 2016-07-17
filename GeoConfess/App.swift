//
//  App.swift
//  KILLFISH
//
//  Created by Матвей Кравцов on 02.02.16.
//  Copyright © 2016 Матвей Кравцов. All rights reserved.
//

import Foundation

class App{
    static let store = NSUserDefaults.standardUserDefaults()
    static var user = User(username: "")
    static var isLogged: Bool! {
        return user.username != ""
    }
    
    
    
}