//
//  FlightPath.swift
//  AlamofireDemo
//
//  Created by Admin on 30/06/2016.
//  Copyright © 2016 demo. All rights reserved.
//

import UIKit

class FlightPath {

    static var sharedFlightPaths = [FlightPath]()
    static var sharedDayWiseFlights = [String: [FlightPath]]()
    
    var  DateDeparture:String?
    var DateReturn:String?
    var  Destination:String?
    var  Errors: String?
    var Origin:String?
    var flights = [Flights]()
    
    
    init(DateDeparture:String?,DateReturn:String?,Destination:String?,Errors: String?,Origin:String?, flights: [Flights]){
        
        
        self.DateDeparture = DateDeparture
        self.DateReturn = DateReturn
        self.Destination = Destination
        self.Errors = Errors
        self.Origin = Origin
        self.flights = flights
        
    }
    
}
