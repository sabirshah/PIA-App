//
//  User.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/25/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import Foundation
//import RealmSwift

class User {
    
    dynamic var userID : String?
    dynamic var Status : String?
    dynamic var Status_Message : String?
    dynamic var TOKENID : String?
    dynamic var Name : String?
    dynamic var BirthDate : String?
    dynamic var Email_Address : String?
    dynamic var MobileNo : String?
    dynamic var balancePoints : String?
    dynamic var date : Date?
    dynamic var Address : String?
    dynamic var password : String?
    dynamic var home_no : String?
    dynamic var mobile_no : String?
    dynamic var City : String?
    dynamic var Country : String?
    static var sharedInstance: User?
    
//    init(Status:String?,Status_Message:String?,TOKENID:String?,User_Name:String?,User_Email:String?,MobileNo:String?, balancePoints:String?)
//    {
//        self.Status = Status
//        self.Status_Message = Status_Message
//        self.TOKENID = TOKENID
//        self.Name = User_Name
//        self.Email_Address = User_Email
//        self.MobileNo = MobileNo
//        self.balancePoints = balancePoints
//    }
}
