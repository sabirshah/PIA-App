//
//  FlightPath_Schedule.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/29/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//


    import UIKit
    
    class FlightPath_Schedule {
        
        static var sharedFlightPaths_schedule = [FlightPath_Schedule]()
        
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

