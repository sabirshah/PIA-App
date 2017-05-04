//
//  SignUpUserService.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/25/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class SignUpUserService: NSObject {
    
    
    static func SingUpNewUser(_title:String, firstName:String,lastName:String,nic:String,dob:String,mobileNo:String,emailAddress:String,homeAddress:String,gender:String,city:String,country:String , completion:@escaping (_ signup:SignUp? , _ error:String?)->Void){
        
        
      //  http://piaawards.com/API/AwardsSignup.cfm?Title=Mr&First_Name=AHaider&Last_Name=Ali&DOB=2012-01-01&Email_Address=alay.haider1@piac.aero&Home_Address=ABC%20123&City=Karachi&Country=PK&Passport=123&NIC=123&MobileNo=92-332-7925056&Gender=M&Source=A
        
        
        let url = "\(Constant.urlSignUpAward)Title=\(_title)&First_Name=\(firstName)&Last_Name=\(lastName)&NIC=\(nic)&DOB=\(dob)&City=\(city)&Country=\(country)&Gender=\(gender)&Email_Address=\(emailAddress)&Home_Address=\(homeAddress.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)&MobileNo=\(mobileNo)&Source=I"
        
        Alamofire.request(url).responseJSON { (response) in
            
            
            if(response.result.error == nil )
            {
                print(response.result.value)
                let jsonObject = JSON(response.result.value!)
                
                if let _ = jsonObject["RESPONSE"].array {
                   
                    let STATUS=jsonObject["RESPONSE"].arrayValue[0]["STATUS"].stringValue
                    let STATUS_MESSAGE=jsonObject["RESPONSE"].arrayValue[0]["STATUS MESSAGE"].stringValue
                    let refrenceNo = jsonObject["RESPONSE"].arrayValue[0]["ReferenceNo"].stringValue

                    if ( STATUS == "1" ) {
                    let _SignUp = SignUp(Status: STATUS, Status_Message: STATUS_MESSAGE, First_Name: firstName, Last_Name: lastName, User_Email: emailAddress, MobileNo: mobileNo, Address: homeAddress ,refrenceNo:refrenceNo)
                    
                    completion(_SignUp, nil)
                    } else {
                                            completion(nil, jsonObject["RESPONSE"].arrayValue[0]["STATUS MESSAGE"].stringValue)
                    }
                    
                    
                }else if let _ = jsonObject["RESPONSE"].array {
                    
                    completion(nil, jsonObject["RESPONSE"].arrayValue[0]["STATUS MESSAGE"].stringValue)
                    
                }else{
                    
                    completion(nil, jsonObject["Parameter_Value_Invalid"].arrayValue[0]["STATUS MESSAGE"].stringValue)
                
                }
  
            }
            else
            {
                completion(nil, response.result.error?.localizedDescription)
            }
        }
    }
}

