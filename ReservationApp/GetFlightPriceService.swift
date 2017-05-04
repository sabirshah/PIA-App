//
//  GetFlightPriceService.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 8/3/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class GetFlightPriceService: NSObject {

    static func GetFlightPrice(_ origin:String, destination:String, departureDate:String, NumberOfAdults:String, NumberOfChildren:String, NumberOfInfants:String, numberOfDays:String, BookingClass:String,Type : String, completion:@escaping (_ flights:[fpFlightPaths]?, _ error:String?)->Void){
        
        Alamofire.request("\(Constant.urlFlightPrice)origin=\(origin)&destination=\(destination)&departureDate=\(departureDate)&NumberOfAdults=\(NumberOfAdults)&NumberOfChildren=\(NumberOfChildren)&NumberOfInfants=\(NumberOfInfants)&numberOfDays=\(numberOfDays)&BookingClass=\(BookingClass)").responseJSON { (response) in
            
//            print(response.result.value!)
            
            if(response.result.error == nil )
            {
                let jsonObject = JSON(response.result.value!).array
                let array = jsonObject![0]["FlightPaths"].arrayValue
                
                var flightpathsArray = [fpFlightPaths]()
                
                print(jsonObject)
                
                for item in array {
                    let BusinessFare = item["BusinessFare"].stringValue
                    let EconomyPlusFare = item["EconomyPlusFare"].stringValue
                    let EconomyFare = item["EconomyFare"].stringValue
                    let Origin = item["Origin"].stringValue
                    let Destination = item["Destination"].stringValue
                    let DepartureDate = item["DepartureDate"].stringValue
                    let ArrivalDate = item["ArrivalDate"].stringValue
                    let DateReturn = item["DateReturn"].stringValue
                    let Errors = item["Errors"].stringValue
                    var flightsArray = [fpFlights]()
                
                    
                      
                    
                for item in item["Flights"].arrayValue {
                    let DaysOfOperation = item["DaysOfOperation"].stringValue
                    let BookingClasses = bookingClasses(item["BookingClasses","Business"].stringValue,item["BookingClasses","Economy"].stringValue,item["BookingClasses","EconomyPlus"].stringValue)
                    let Carrier = item["Carrier"].stringValue
                    let FlightNo = item["FlightNo"].stringValue
                    let Origin = item["Origin"].stringValue
                    let Destination = item["Destination"].stringValue
                    let DepartureDate = item["DepartureDate"].stringValue
                    let ArrivalDate = item["ArrivalDate"].stringValue
                    let details =   Details(item["Details","AirMiles"].stringValue , item["Details","ElapsedTime"].stringValue,item["Details","Equipment"].stringValue,item["Details","Meals",0].stringValue,item["Details","Smoking"].stringValue,item["Details","Stops"].stringValue)
                    let ElapsedTime = item["ElapsedTime"].stringValue
                    let AirMiles = item["AirMiles"].stringValue
                    
                    let _flights = fpFlights(DaysOfOperation: DaysOfOperation, bookingclasses: BookingClasses, Carrier: Carrier, FlightNo: FlightNo, Origin: Origin, Destination: Destination, DepartureDate: DepartureDate, ArrivalDate: ArrivalDate, details: details, ElapsedTime: ElapsedTime, AirMiles: AirMiles)
                    
                    flightsArray.append(_flights)
                    }
                    let _flightPaths = fpFlightPaths(BusinessFare: BusinessFare, EconomyPlusFare: EconomyPlusFare, EconomyFare: EconomyFare, Origin: Origin, Destination: Destination, DepartureDate: DepartureDate, ArrivalDate:ArrivalDate, DateReturn: DateReturn, Errors: Errors, flights: flightsArray)
                    
                    if (BookingClass == "B")
                    {
                        if( BusinessFare != "0")
                        {
                            flightpathsArray.append(_flightPaths)
                        }
                        
                    }
                    else if (BookingClass == "P")
                    {
                        if( EconomyPlusFare != "0")
                        {
                            flightpathsArray.append(_flightPaths)
                        }

                    }
                    else if (BookingClass == "Y")
                    {
                        if( EconomyFare != "0")
                        {
                            flightpathsArray.append(_flightPaths)
                        }

                    }

                    
                    
                    
                }
                if Type == "Return"
                {
                    fpFlightPaths.sharedfpFlightPaths.append(contentsOf: flightpathsArray)
                }
                else
                {
                    fpFlightPaths.sharedfpFlightPaths = flightpathsArray
                }
                completion(flightpathsArray, nil)

            }
            else{
                completion(nil, response.result.error?.localizedDescription)
            }
        }
    }


}
