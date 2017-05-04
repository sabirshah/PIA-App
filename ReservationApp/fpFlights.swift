//
//  fpFlights.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 8/3/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class fpFlights {

        var DaysOfOperation:String?
        var bookingclasses:bookingClasses?  //typealias
        var Carrier:String?
        var FlightNo:String?
        var Origin:String?
        var Destination:String?
        var DepartureDate:String?
        var ArrivalDate:String?
        var details:Details?                 //typealias
        var ElapsedTime:String?
        var AirMiles:String?

    init(DaysOfOperation:String?,bookingclasses:bookingClasses?,Carrier:String?,FlightNo:String?,Origin:String?,Destination:String?,DepartureDate:String?,ArrivalDate:String?,details:Details?,ElapsedTime:String?,AirMiles:String?){
        
        self.DaysOfOperation = DaysOfOperation
        self.bookingclasses = bookingclasses
        self.Carrier = Carrier
        self.FlightNo = FlightNo
        self.Origin = Origin
        self.Destination = Destination
        self.DepartureDate = DepartureDate
        self.ArrivalDate = ArrivalDate
        self.details = details
        self.ElapsedTime = ElapsedTime
        self.AirMiles = AirMiles
    }
}
