//
//  GetPNRService.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/26/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class GetPNRService: NSObject {

    static func GetPNR(_ PNR:String, completion:@escaping (_ pnr:BookingDetails? , _ error:String?)->Void){
        
        
        Alamofire.request("\(Constant.urlGetPNR)_pnr=\(PNR)").responseJSON { (response) in

            if(response.result.error == nil )
            {
                let jsonObject = JSON(response.result.value!)
                print(jsonObject)

                
                self.parseForRealM(jsonObject, completion: { (booking) in
                    
                    completion(booking, nil)

                })
                
                
            }else{
                
                
                completion(nil, response.result.error?.localizedDescription)
                
                
            }
  
        }
    }
    
    
    
    
//    private static  func parseJSON(jsonObject:JSON){
//            
//            let flightsArray = jsonObject["Flights"].arrayValue
//            let paxArray = jsonObject["Passengers"].arrayValue
//            let ticketArray = jsonObject["Tickets"].arrayValue
//            
//            var flightPNRArray = [FlightPNR]()
//            var passangerArrray = [PassengerPNR]()
//            var ticketsArray = [String]() // holds the ticket string only
//            
//            
//            for ticketNumbers in ticketArray{
//                
//                let ticketNo = ticketNumbers["TicketString"].stringValue
//                ticketsArray.append(ticketNo)
//            }
//            
//            for passengerDetail in paxArray{
//                
//                let passengerType = passengerDetail["PassengerType"].stringValue
//                let seatNo = passengerDetail["Seats"].stringValue
//                let firstName = passengerDetail["FirstName"].stringValue
//                let lastName = passengerDetail["LastName"].stringValue
//                let paxCount = passengerDetail["NameNumber"].stringValue
//                
//                let pasanger = PassengerPNR(passengerType: passengerType, seatNo: seatNo, firstName: firstName, lastName: lastName, paxCount: paxCount)
//                
//                passangerArrray.append(pasanger)
//                
//                
//            }
//            
//            for itineraries in flightsArray {
//                
//                let Origin = itineraries["Origin"].stringValue
//                let FlightNo = itineraries["FlightNo"].stringValue
//                let Destination = itineraries["Destination"].stringValue
//                let ReservedStatus = itineraries["ReservedStatus"].stringValue
//                let SegmentNumber = itineraries["SegmentNumber"].stringValue
//                let DepartureDate = itineraries["DepartureDate"].stringValue
//                let ArrivalDate = itineraries["ArrivalDate"].stringValue
//                let ReservedClass = itineraries["ReservedClass"].stringValue
//                
//                let flightSector = FlightPNR(Origin:Origin,FlightNo:FlightNo,Destination:Destination,ReservedStatus:ReservedStatus,SegmentNumber:SegmentNumber ,DepartureDate:DepartureDate,ArrivalDate:ArrivalDate,ReservedClass:ReservedClass)
//                
//                flightPNRArray.append(flightSector)
//                
//                
//            }
//            
//            let bookingDetails = BookingDetails(passangerPNRArray: passangerArrray, ticketPNRArray: ticketsArray, flightsPNRArray: flightPNRArray)
//            
//            BookingDetails.sharedInstance = bookingDetails
//            
//
//        }
    
    
    
    static func parseForRealM(_ jsonObject:JSON , completion:(_ booking:BookingDetails)->Void){
        
        
            let flightsArray = jsonObject["Flights"].arrayValue
            let paxArray = jsonObject["Passengers"].arrayValue
            let ticketArray = jsonObject["Tickets"].arrayValue
            
            var flightPNRArray = [FlightPNR]()
            var passangerArrray = [PassengerPNR]()
            var ticketsArray = [String]() // holds the ticket string only
        
        let bookingDetails = BookingDetails()

        
            for ticketNumbers in ticketArray{
                
                let ticketNo = ticketNumbers["TicketString"].stringValue
//                ticketsArray.append(ticketNo)
                let ticketpnr = ticketsPnr()
                ticketpnr.ticketPnr = ticketNo
                bookingDetails.ticketPNRArray.append(ticketpnr)
                
            }
        
            for passengerDetail in paxArray{
                
                let passengerType = passengerDetail["PassengerType"].stringValue
                let seatNo = passengerDetail["Seats"].stringValue
                let firstName = passengerDetail["FirstName"].stringValue
                let lastName = passengerDetail["LastName"].stringValue
                let paxCount = passengerDetail["NameNumber"].stringValue
                
//                let pasanger = PassengerPNR(passengerType: passengerType, seatNo: seatNo, firstName: firstName, lastName: lastName, paxCount: paxCount)
                
                
                let pasanger = PassengerPNR()
                pasanger.firstName = firstName
                pasanger.lastName = lastName
                pasanger.paxCount = paxCount
                pasanger.seatNo = seatNo
                pasanger.passengerType = passengerType

//                passangerArrray.append(pasanger)
                bookingDetails.passangerPNRArray.append(pasanger)
                
                
            }
            
            for itineraries in flightsArray {
                
                let Origin = itineraries["Origin"].stringValue
                let FlightNo = itineraries["FlightNo"].stringValue
                let Destination = itineraries["Destination"].stringValue
                let ReservedStatus = itineraries["ReservedStatus"].stringValue
                let SegmentNumber = itineraries["SegmentNumber"].stringValue
                let Carrier = itineraries["Carrier"].stringValue
                let DepartureDate = itineraries["DepartureDate"].stringValue
                let ArrivalDate = itineraries["ArrivalDate"].stringValue
                let ReservedClass = itineraries["ReservedClass"].stringValue
                
//                let flightSector = FlightPNR(Origin:Origin,FlightNo:FlightNo,Destination:Destination,ReservedStatus:ReservedStatus,SegmentNumber:SegmentNumber ,DepartureDate:DepartureDate,ArrivalDate:ArrivalDate,ReservedClass:ReservedClass)
                
                
                let flightSector = FlightPNR()
                flightSector.Origin = Origin
                flightSector.FlightNo = FlightNo
                flightSector.Destination = Destination
                flightSector.ReservedStatus = ReservedStatus
                flightSector.SegmentNumber = SegmentNumber
                flightSector.DepartureDate = DepartureDate
                flightSector.ArrivalDate = ArrivalDate
                flightSector.ReservedClass = ReservedClass
                flightSector.Carrier = Carrier
//                flightPNRArray.append(flightSector)
                bookingDetails.flightsPNRArray.append(flightSector)
                
            }
            
//            let bookingDetails = BookingDetails(passangerPNRArray: passangerArrray, ticketPNRArray: ticketsArray, flightsPNRArray: flightPNRArray)
        
//        bookingDetails.passangerPNRArray = passangerArrray
//        bookingDetails.ticketPNRArray = ticketsArray
//        bookingDetails.flightsPNRArray = flightPNRArray

//            BookingDetails.sharedInstance = bookingDetails
        completion(bookingDetails)
            
        }

    
}
