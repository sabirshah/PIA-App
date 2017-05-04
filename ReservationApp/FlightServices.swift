//
//  FlightServices.swift
//  AlamofireDemo
//
//  Created by Admin on 30/06/2016.
//  Copyright © 2016 demo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class FlightServices {

               
    
    
    static func getFlightAvailibilityAsync(_ date:String,orign:String,des:String , completion:@escaping (_ flights:[FlightPath]? , _ error:String?)->Void){
        
        
        Alamofire.request("\(Constant.urlFlightAvailibilty)origin=\(orign)&destination=\(des)&departureDate=\(date)").responseJSON { (response) in
            

            
            print(response.result.value)
            
            
            
            if (response.result.error == nil ){
            
                
                
                
                
                let jsonObject = JSON(response.result.value!)
                let array = jsonObject["FlightPaths"].arrayValue
                
                var flightpathsArray = [FlightPath]()
            
                
                for item in array {
                    
                    let DateDeparture = item["DateDeparture"].stringValue
                    let DateReturn = item["DateReturn"].stringValue
                    let Destination = item["Destination"].stringValue
                    let Errors = item["Errors"].stringValue
                    let Origin = item["Origin"].stringValue
                    var flightsArray = [Flights]()
                    
                    for item in item["Flights"].arrayValue {
                        
                        let Carrier = item["Carrier"].stringValue
                        let ArrivalDate = item["ArrivalDate"].stringValue
                        let BookingClasses = bookingClasses(item["BookingClasses","Business"].stringValue,item["BookingClasses","Economy"].stringValue,item["BookingClasses","EconomyPlus"].stringValue)
                        let daysOfOperation = DaysOfOperation( item["Fri","DaysOfOperation"].boolValue,item["Sat","DaysOfOperation"].boolValue,item["Sun","DaysOfOperation"].boolValue,item["Mon","DaysOfOperation"].boolValue,item["Tue","DaysOfOperation"].boolValue,item["Wed","DaysOfOperation"].boolValue,item["Thu","DaysOfOperation"].boolValue)
                        let DepartureDate = item["DepartureDate"].stringValue
                        let Destination = item["Destination"].stringValue
                        let details =   Details( item["Details","AirMiles"].stringValue , item["Details","ElapsedTime"].stringValue,item["Details","Equipment"].stringValue,item["Details","Meals",0].stringValue,item["Details","Smoking"].stringValue,item["Details","Stops"].stringValue)
                        
                        let FlightNo = item["FlightNo"].stringValue
                        let Origin = item["Origin"].stringValue
                        
                        
                        
                        let fligths = Flights(ArrivalDate: ArrivalDate, bookingclasses: BookingClasses, Carrier: Carrier, daysOfOperation: daysOfOperation, DepartureDate: DepartureDate, Destination: Destination, details: details, FlightNo: FlightNo, Origin: Origin)
                        
                        flightsArray.append(fligths)
                        
                        
                    }
                
                    let FlightPaths = FlightPath(DateDeparture: DateDeparture, DateReturn: DateReturn, Destination: Destination, Errors: Errors, Origin: Origin, flights: flightsArray)

                    flightpathsArray.append(FlightPaths)

                    
                }
                
                FlightPath.sharedFlightPaths = flightpathsArray
                completion(flightpathsArray, nil)
                
                
                
            }else{
                
            
                completion(nil, response.result.error?.localizedDescription)

                print( response.result.error)
            }
            
            
            
            
        }
        
            
    }
    
    
    
}
