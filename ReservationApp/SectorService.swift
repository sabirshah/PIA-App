//
//  SectorService.swift
//  Passenger_Booking
//
//  Created by Sabir Shah on 7/13/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//


import UIKit
import SwiftyJSON
import Alamofire

class SectorService: NSObject {
    
    
    
    static func getSectorsAsync( _ completion:@escaping (_ Origins:[Origin]? , _ error:String?)->Void){
        Alamofire.request("\(Constant.urlSectors)").responseJSON { (response) in
            
          //  print(response.result.value)
            
            if(response.result.error == nil )
            {
                let jsonObject = JSON(response.result.value!)
                let array = jsonObject.arrayValue
               print(array)
               
                
                
                

                var OriginArray = [Origin]()
                
                for item in array {
                    
                    let origin =    item["Origin"]

                    let Code = origin["CityCode"].stringValue
                    let Name = origin["CityName"].stringValue.uppercased()
                    
             
                
                    
                    var DestinationArray = [Destination]()
                    
                    for item2 in item["Destinations"].arrayValue
                    {
                        let Code = item2["CityCode"].stringValue
                        let Name = item2["CityName"].stringValue.uppercased()
                        
                       DestinationArray.append( Destination(Code: Code,Name: Name + "(\(Code))"))
                        
                       
                    }
                    
                    let destArray =   DestinationArray.sorted { $0.Name?.localizedCaseInsensitiveCompare($1.Name!) == ComparisonResult.orderedAscending }
                    
                    OriginArray.append(Origin(Code: Code,Name: Name + "(\(Code))",Destinations: destArray))
                    
                }

               let originArray = OriginArray.sorted { $0.Name?.localizedCaseInsensitiveCompare($1.Name!) == ComparisonResult.orderedAscending }
                
                Origin.sharedOrigins = originArray

                 Origin.OriginNames = originArray.map{$0.Name!}
                
                completion(originArray, response.result.error?.localizedDescription)

            }
            else
            {
                completion(nil, response.result.error?.localizedDescription)
            }
        }
    }
    
    
}

