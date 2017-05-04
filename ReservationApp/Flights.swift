//
//  Flights.swift
//  AlamofireDemo
//
//  Created by Admin on 30/06/2016.
//  Copyright © 2016 demo. All rights reserved.
//

import UIKit

class Flights {

    var ArrivalDate:String?
    var bookingclasses:bookingClasses?
    var Carrier:String?
    var daysOfOperation:DaysOfOperation!
    var DepartureDate:String?
    var Destination:String?
    var details:Details?
    var FlightNo:String?
    var Origin:String?
    
    init(ArrivalDate:String?, bookingclasses:bookingClasses?,Carrier:String?,daysOfOperation: DaysOfOperation!,DepartureDate:String?,Destination:String? ,details:Details?,FlightNo:String?,Origin:String?){
        
        self.ArrivalDate = ArrivalDate
        self.bookingclasses = bookingclasses
        self.Carrier = Carrier
        self.daysOfOperation = daysOfOperation
        self.DepartureDate = DepartureDate
        self.Destination = Destination
        self.details = details
        self.FlightNo = FlightNo
        self.Origin = Origin
        
        
    }
    
    
    
    
}
