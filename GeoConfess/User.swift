//
//  User.swift
//  KILLFISH
//
//  Created by Матвей Кравцов on 02.02.16.
//  Copyright © 2016 Матвей Кравцов. All rights reserved.
//

import Foundation

class User{
    
 
    var username: String = ""
    var access_token: String = ""
    var refresh_token: String = ""
    var token_type:String = ""
    var created_at:Double = 0
    var json: NSDictionary!
    
    init(username:String){
        self.username = username
    }
    
    func updateInfo(json:NSDictionary){
        self.json = json
        access_token = json["access_token"] as! String
        refresh_token = json["refresh_token"] as! String
        token_type = json["token_type"] as! String
        created_at = json["created_at"] as! Double
    }
    
}