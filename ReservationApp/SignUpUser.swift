//
//  SignUpUser.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/25/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class SignUp: NSObject {
    
    var Status:String?
    var Status_Message: String?
    var FirstName:String?
    var LastName:String?
    var Email_Address:String?
    var MobileNo:String?
    var Address:String?
    var refrenceNo:String?
    
    init(Status:String?,Status_Message:String?,First_Name:String?,Last_Name:String?,User_Email:String?,MobileNo:String?,Address:String?,refrenceNo:String?)
    {
        
        self.Status = Status
        self.Status_Message = Status_Message
        self.FirstName = First_Name
        self.LastName = Last_Name
        self.Email_Address = User_Email
        self.MobileNo = MobileNo
        self.Address=Address
        self.refrenceNo = refrenceNo
    }
    
}
