//
//  APICalls.swift
//  KILLFISH
//
//  Created by Матвей Кравцов on 01.02.16.
//  Copyright © 2016 Матвей Кравцов. All rights reserved.
//

import UIKit

class APICalls: NSObject {
    
    static func login(username:String, password:String, onCompletion: (Bool)->Void, onError: (String)->Void){
        callApi("POST", parameters: ["username":username, "password":password]) { (json) -> Void in
            
            if let j = json["access_token"]{
                print(j as! String)
                App.user = User(username: username)
                App.user.updateInfo(json)
                onCompletion(true)
            }else{
                onError(json["error_description"] as! String)
            }
            
        }
        
    }

    
    static func callApi(method:String, parameters:NSDictionary, onCompletion: (NSDictionary) -> Void){
        
        let act: String = method
        
        var postStr:String = "grant_type=password"
        
        for (key, value) in parameters {
            postStr+="&\(key)=\(value)"
        }
        
        var url: String = "https://geoconfess.herokuapp.com/oauth/token"
        if act=="GET" {
            url+="?\(postStr)"
        }
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = act
            
        if act=="POST" {
                
            let postString = postStr
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
            
        }
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            guard error == nil else {
                print("error calling GET or POST")
                print(error)
                return
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
            print("responseString = \(responseString)")
            
            let result: NSDictionary
            do {
                result = try NSJSONSerialization.JSONObjectWithData(responseData,
                    options: []) as! NSDictionary
            } catch  {
                print("error parsing response")
                return
            }
            dispatch_async(dispatch_get_main_queue(),{
                onCompletion(result)
            } )
            
            
        }
        task.resume()
        
    }

}
