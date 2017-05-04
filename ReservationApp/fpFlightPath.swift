//
//  fpFlightPath.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 8/3/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class fpFlightPaths {
    
    static var sharedfpFlightPaths = [fpFlightPaths]()
    

    
    var BusinessFare:String?
    var EconomyPlusFare:String?
    var EconomyFare:String?
    var Origin:String?
    var Destination:String?
    var DepartureDate:String?
    var ArrivalDate:String?
    var DateReturn:String?
    var Errors: String?
    var flights = [fpFlights]()
    
    init(BusinessFare:String?,EconomyPlusFare:String?,EconomyFare:String?,Origin:String?,Destination:String?,DepartureDate:String?,ArrivalDate:String?, DateReturn:String?,Errors: String?,flights: [fpFlights]){
        
        self.BusinessFare = BusinessFare
        self.EconomyPlusFare = EconomyPlusFare
        self.EconomyFare = EconomyFare
        self.Origin = Origin
        self.Destination = Destination
        self.DepartureDate = DepartureDate
        self.ArrivalDate = ArrivalDate
        self.DateReturn = DateReturn
        self.Errors = Errors
        self.flights = flights
    }
    
}

