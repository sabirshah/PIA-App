//
//  Departure.swift
//  ReservationApp
//
//  Created by Sabir Shah on 1/19/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class Departure: NSObject {

    
//    static var sharedFlightPaths = [FlightPath]()
//    static var sharedDayWiseFlights = [String: [FlightPath]]()
    
    var  OriginCode:String?
    var  OriginText:String?
    var  DestinationCode:String?
    var  DestinationText: String?
    var  DepartureDate:String?
    
    
    init(OriginCode:String?,OriginText:String?,DestinationCode:String?,DestinationText: String?,DepartureDate:String?){
        
        
        self.OriginCode = OriginCode
        self.OriginText = OriginText
        self.DestinationCode = DestinationCode
        self.DestinationText = DestinationText
        self.DepartureDate = DepartureDate
        
    }
    
}
