//
//  Origin.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//


import UIKit

class Origin {
    
    static var sharedOrigins = [Origin]()
    static var OriginNames = [String]()
    static var isReturn:Bool = true
    
    var  Code:String?
    var  Name:String?
    var  Destinations = [Destination]()
    
    
    init(Code:String?,Name:String?,Destinations:[Destination]){
        
        self.Code = Code
        self.Name = Name
        self.Destinations = Destinations
        
        
}
}
