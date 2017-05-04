//
//  FlightStatusDetails.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/4/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//



import UIKit

class FlightStatusDetails {
    
    
    var  ArrivalDate:String?
    var Carrier:String?
    var  DepartureDate:String?
    var  ActualDepartureDate: String?
    var ActualArrivalDate:String?
    var  Destination:String?
    var Details:String?
    var  Errors:String?
    var  FlightNo: String?
    var  Origin: String?
    var  ETA:String?
    var  ETD:String?

    
    init(ArrivalDate:String?,Carrier:String?,DepartureDate:String?,ActualDepartureDate: String?,ActualArrivalDate:String?, Destination: String? ,Details:String? , Errors : String? ,FlightNo : String? ,Origin : String?,      ETA:String? ,  ETD:String?

  ){
        
        
        self.ArrivalDate = ArrivalDate
        self.Carrier = Carrier
        self.DepartureDate = DepartureDate
        self.ActualDepartureDate = ActualDepartureDate
        self.ActualArrivalDate = ActualArrivalDate
        self.Destination = Destination
        self.Details = Details
        self.Errors = Errors
        self.FlightNo = FlightNo
        self.Origin = Origin
        self.ETA = ETA
        self.ETD = ETD

    }
    
}
