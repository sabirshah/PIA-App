//
//  FeedBack.swift
//  ReservationApp
//
//  Created by Sabir Shah on 11/1/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FeedBack: NSObject {

     static var Title : String? = ""
     static var FirstName : String? = ""
     static var MiddleName : String? = ""
     static var LastName: String? = ""
     static var Email : String? = ""
     static var PhoneC: String? = ""
     static var PhoneH: String? = ""
     static var FlightNo : String? = ""
     static var FlightDT : String? = ""
     static var Comments:String? = ""
     static var Source:String? = "IOS"
     static var FeedBackDepartments = [Int : FeedBackDepartment]()
    
  }
