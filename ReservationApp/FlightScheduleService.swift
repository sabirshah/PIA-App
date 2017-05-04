//
//  FlightScheduleService.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/29/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//


    import UIKit
    import SwiftyJSON
    import Alamofire

extension JSON {
    public var isNull: Bool {
        get {
            return self.type == .null;
        }
    }
}

    class FlightScheduleService {
        
        
        
        
        
        static func getFlightScheduleAsync(_ departureDate:String,returnDate:String, origin:String,destination:String , completion:@escaping (_ flights:[FlightPath]? , _ error:String?)->Void){
            
            
            
             Alamofire.request("\(Constant.urlFlightSchedule)origin=\(origin)&destination=\(destination)&departureDate=\(departureDate)&returnDate=").responseJSON { (response) in
                
                print(response.result.value)
                print(origin)
                print(destination)
                print(returnDate)
                
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
                            let daysOfOperation = DaysOfOperation( item["DaysOfOperation","Fri"].boolValue,item["DaysOfOperation","Sat"].boolValue,item["DaysOfOperation","Sun"].boolValue,item["DaysOfOperation","Mon"].boolValue,item["DaysOfOperation","Tue"].boolValue,item["DaysOfOperation","Wed"].boolValue,item["DaysOfOperation","Thu"].boolValue)
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
                    
                   // FlightPath.sharedFlightPaths = flightpathsArray
                    
                    //Creating Day wise Flights dictionary, only add true value
                    var FriArr = [FlightPath]()
                    var MonArr = [FlightPath]()
                    var SatArr = [FlightPath]()
                    var SunArr = [FlightPath]()
                    var ThuArr = [FlightPath]()
                    var TueArr = [FlightPath]()
                    var WedArr = [FlightPath]()
                    
                    if ( flightpathsArray.count > 0 )
                    {
                    for index in 0...flightpathsArray.count-1 {
                        
                        for index2 in 0...flightpathsArray[index].flights.count-1 {
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Fri == true )
                            {
                                FriArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Mon == true )
                            {
                                MonArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Sat == true )
                            {
                                SatArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Sun == true )
                            {
                                SunArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Thu == true )
                            {
                                ThuArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Tue == true )
                            {
                                TueArr.append(flightpathsArray[index])
                            }
                            if( flightpathsArray[index].flights[index2].daysOfOperation.Wed == true )
                            {
                                WedArr.append(flightpathsArray[index])
                            }

                        }
                        }
                        
                        }

                    FlightPath.sharedDayWiseFlights["Fri"] = FriArr
                    FlightPath.sharedDayWiseFlights["Mon"] = MonArr
                    FlightPath.sharedDayWiseFlights["Sat"] = SatArr
                    FlightPath.sharedDayWiseFlights["Sun"] = SunArr
                    FlightPath.sharedDayWiseFlights["Thu"] = ThuArr
                    FlightPath.sharedDayWiseFlights["Tue"] = TueArr
                    FlightPath.sharedDayWiseFlights["Wed"] = WedArr
                    

                    
                    
                    
                    
                    completion(flightpathsArray, nil)
                    
                    
                    
                }else{
                    
                    
                    completion(nil, response.result.error?.localizedDescription)
                    
                    
                }
                
                
                
                
            }
            
            
        }
        
        
        
        static func getFlightNumberDetailAsync(_ flightNo:String,departureDate:String, completion:@escaping (_ flights:[FlightStatusDetails]? , _ error:String?)->Void){
            
            
            Alamofire.request("\(Constant.urlFlightNumber)flightNo=\(flightNo)&departureDate=\(departureDate)").responseJSON { (response) in
                
                
                
                print(response.result.value)
               
                if (response.result.error == nil ){
                    var flights = [FlightStatusDetails]()
                    let jsonObjects = JSON(response.result.value!)
                    for jsonObject in jsonObjects.arrayValue
                    {
                    
                    if let error =  jsonObject.dictionary!["Errors"]!.null{
                      
                        let   ArrivalDate =  jsonObject.dictionary!["ArrivalDate"]!.stringValue
                        let   Carrier =   jsonObject.dictionary!["Carrier"]!.stringValue
                        let   DepartureDate =  jsonObject.dictionary!["DepartureDate"]!.stringValue
                        var   ActualDepartureDate = ""
                        var   ActualArrivalDate = ""
                        var   ETA = ""
                        var   ETD = ""
                        
                        if !jsonObject["ActualInfo"].isNull
                        {
                           ActualDepartureDate =   (jsonObject["ActualInfo"].dictionary!["OffGate"]!.isNull) ? "" : jsonObject["ActualInfo"].dictionary!["OffGate"]!.stringValue
                           ActualArrivalDate =  (jsonObject["ActualInfo"].dictionary!["OnGate"]!.isNull) ? "" : jsonObject["ActualInfo"].dictionary!["OnGate"]!.stringValue
                           ETA = (jsonObject["ActualInfo"].dictionary!["ETA"]!.isNull) ? "" : jsonObject["ActualInfo"].dictionary!["ETA"]!.stringValue
                           ETD = (jsonObject["ActualInfo"].dictionary!["ETD"]!.isNull) ? "" : jsonObject["ActualInfo"].dictionary!["ETD"]!.stringValue
                        }
                        let   Destination =   jsonObject.dictionary!["Destination"]!.stringValue
                        let   Details =   jsonObject.dictionary!["Details"]!.stringValue
                        let   Errors =   jsonObject.dictionary!["Errors"]!.stringValue
                        let   FlightNo =   jsonObject["FlightNo"].stringValue
                        let    Origin =   jsonObject.dictionary!["Origin"]!.stringValue
                        
                        print("FlightNo=\(jsonObject)")
                        
                        let flight = FlightStatusDetails(ArrivalDate: ArrivalDate, Carrier: Carrier, DepartureDate: DepartureDate, ActualDepartureDate: ActualDepartureDate, ActualArrivalDate: ActualArrivalDate, Destination: Destination, Details: Details, Errors: Errors, FlightNo: FlightNo, Origin: Origin,ETA: ETA, ETD: ETD)
                        
                        //  FlightStatusDetails.sharedFlightStatusDetails = fligths
                        flights.append(flight)
                        }
                    else
                    {
                        completion(nil, jsonObject.dictionary!["Errors"]![0]["InternalMessage"].string?.capitalized)
                        
                        }

                    }
                    
                        completion(flights, nil)
                  
                }else{
                    
                    
                    completion(nil, response.result.error?.localizedDescription)
                    
                    print( response.result.error)
                }
                
                
                
                
            }
            
            
        }

        
        
        
}

