//
//  Destination.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class Destination: NSObject {
    
    static var sharedDestination = [Destination]()
    
    var Code : String?
    var Name : String?
    
    init(Code:String?, Name:String?)
    {
        self.Code = Code
        self.Name = Name
    }
}