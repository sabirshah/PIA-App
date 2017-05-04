//
//  CheckVersionServices.swift
//  ReservationApp
//
//  Created by Admin on 20/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CheckVersionServices {

    static func isUpdated(completion:@escaping (_ action:String?,_ message:String?,_ error:String?)->Void){
        
        var app_version = CheckVersionServices.getVerion()
       
//        app_version = "1.0"
        
        Alamofire.request("\(Constant.versionCheckUrl)Source=IOS&App_name=PIA_APP&VersionID=\(app_version)").responseJSON { (response) in

            if response.result.error == nil {
                
                var data = JSON(response.result.value)
                let action = data["OUTPUT",0,"ACTION"].string
                let mesage = data["OUTPUT",0,"MESSAGE"].string

                completion(action, mesage, nil)
                
            }else{
                
                completion(nil, nil, response.result.error?.localizedDescription)
            }
            
            
        
        }
  
    }
    
    
    static func getVerion()->String{
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
}
