//
//  LoginService.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/25/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginService: NSObject {
    
    static func getLogin(_ emailAddress:String,password:String , completion:@escaping (_ user:User? , _ error:String?)->Void){
        
        Alamofire.request("\(Constant.urlLoginAward)ffnum=\(emailAddress)&pin=\(password)").responseJSON { (response) in
            
            if(response.result.error == nil )
            {
                print(response.result.value!)
                let jsonObject = JSON(response.result.value!)
                
                if jsonObject["User_Login"].arrayValue[0]["STATUS"].stringValue == "1"{
                
                    
                    let STATUS=jsonObject["User_Login"].arrayValue[0]["STATUS"].stringValue
                    let STATUS_MESSAGE=jsonObject["User_Login"].arrayValue[0]["STATUS MESSAGE"].stringValue
                    let TOKENID=jsonObject["Token"].arrayValue[0]["TokenID"].stringValue
                    
                    let User_Profile =  jsonObject["User_Profile"].arrayValue
                    let Name = User_Profile[0]["Name"].stringValue
                    let Address = User_Profile[2]["Address"].stringValue
                    let Email_Address = User_Profile[3]["Email_Address"].stringValue
                    let balancePoints = jsonObject["Balance_Points"].arrayValue[0]["Balance"].stringValue
                    let MobileNo = User_Profile[4]["PhoneNos"].arrayValue[1]["Mobile_No"].stringValue

                    
                    
//                    let _User = User(Status: STATUS, Status_Message: STATUS_MESSAGE, TOKENID: TOKENID, User_Name: Name, User_Email: EmailAddress, MobileNo: MobileNo ,  balancePoints: balancePoints)
                    
                    let _User = User()
                    _User.Status = STATUS
                    _User.Status_Message = STATUS_MESSAGE
                    _User.TOKENID = TOKENID
                    _User.Name = Name
                    _User.Email_Address = Email_Address
                    _User.Address = Address
                    _User.MobileNo = MobileNo
                    _User.balancePoints = balancePoints
                    _User.date = Date()
                    _User.userID = emailAddress
                    _User.password = password
                    _User.date = Date()


                    User.sharedInstance = _User
                    completion(_User, nil)

                }else{
                    
                    completion(nil, jsonObject["User_Login"].arrayValue[0]["STATUS MESSAGE"].stringValue)
                }

                
            }
            else
            {
                completion(nil, response.result.error?.localizedDescription)
            }
        }
    }
    
    
    
    static func getPoints(_ token:String , completion:@escaping (_ points:User? , _ error:String?)->Void){
        
        Alamofire.request("\(Constant.urlPointsAward)TokenID=\(token)").responseJSON { (response) in
        

        
            if response.result.error == nil {
                
                let jsonObject = JSON(response.result.value!)
                print(jsonObject)
                if  jsonObject["User_Login"].exists() {
                    
                    
                    let STATUS=jsonObject["User_Login"].arrayValue[0]["STATUS"].stringValue
                    let STATUS_MESSAGE=jsonObject["User_Login"].arrayValue[0]["STATUS MESSAGE"].stringValue
                    let User_Profile =  jsonObject["User_Profile"].arrayValue
                    let Name = User_Profile[0]["Name"].stringValue
                    let Birth_Date = User_Profile[1]["Birth_Date"].stringValue
                    let Address = User_Profile[2]["Address"].stringValue
                    let City = User_Profile[3]["city"].stringValue
                    let Country = User_Profile[4]["country"].stringValue
                    let Email_Address =  User_Profile[6]["Email_Address"].stringValue
                    let home_no = User_Profile[7]["PhoneNos"].arrayValue[0]["Home"].stringValue
                    let mobile_no = User_Profile[7]["PhoneNos"].arrayValue[1]["Mobile_No"].stringValue
                    let balancePoints = jsonObject["Balance_Points"].arrayValue[0]["Balance"].stringValue
                    
                    let _User = User()
                    _User.Status = STATUS
                    _User.Status_Message = STATUS_MESSAGE
                    _User.TOKENID = token
                    _User.Name = Name
                    _User.BirthDate = Birth_Date
                    _User.City = City
                    _User.Country = Country
                    _User.Email_Address = Email_Address
                    _User.balancePoints = balancePoints
                    _User.Address = Address
                    _User.home_no = home_no
                    _User.mobile_no = mobile_no
                    
                    _User.date = Date()
                    _User.userID = User.sharedInstance?.userID
                    _User.password = User.sharedInstance?.password
                    
                    
                    User.sharedInstance = _User
                    completion(_User, nil)
                    
                }else{
                    
                    completion(nil, jsonObject["Token"].arrayValue[0]["STATUS MESSAGE"].stringValue)
                }

                
            }else{
                
                completion(nil, response.result.error?.localizedDescription)
            }
        
        
        }

        
    }
    
}

