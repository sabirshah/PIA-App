
//
//  FeedbackServices.swift
//  ReservationApp
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FeedbackServices {

   
    static func submitFeedback(_ completion:@escaping (_ response:String? , _ error:String?)->Void){
    
        let email = (FeedBack.Email != nil) ? FeedBack.Email! : "alay.ffp@gmail.com"
        
        //piaawards.com/API/postFeedback.cfm?ddlTitle=Optional(\"\") &txtFirstName=nil&txtLastName=Optional(\"\")&txtEmail=alay.ffp@gmail.com&txtPhoneC=nil&FlightNo=Optional(\"300\")&FlightDT=Optional(\"Sun 26 Mar 2017\")&txtMiddleName=Optional(\"\")&txtPhoneH=nil&comments=Optional(\"\")&Source=Optional(\"IOS\")&cat10=0&cat2=0&cat4=0&cat9=0&cat5=0&cat6=0&cat7=0&cat3=0&cat1=5&cat8=0&
        
        
       var feedbackStr = "ddlTitle=\((FeedBack.Title != nil) ? FeedBack.Title! : "")&txtFirstName=\((FeedBack.FirstName != nil) ? FeedBack.FirstName! : "")&txtLastName=\((FeedBack.LastName != nil) ? FeedBack.LastName! : "")&txtEmail=\(email)&txtPhoneC=\((FeedBack.PhoneC != nil) ? FeedBack.PhoneC! : "")&FlightNo=\((FeedBack.FlightNo != nil) ? FeedBack.FlightNo! : "")&FlightDT=\((FeedBack.FlightDT != nil) ? FeedBack.FlightDT! : "")&txtMiddleName=\((FeedBack.MiddleName != nil) ? FeedBack.MiddleName! : "")&txtPhoneH=\((FeedBack.PhoneH != nil) ? FeedBack.PhoneH! : "")&Source=\(FeedBack.Source!)&"
       var comment = ""
        if FeedBack.Comments == nil || FeedBack.Comments == ""
        {
           comment = "comments=No_Comments&"
        }
        else
        {
            comment = "comments=\(FeedBack.Comments!)&"

        }
        comment = comment.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
        
       feedbackStr += comment
        
         //"cat1=5&cat2=5&cat3=4&cat4=4&cat5=3&cat6=3&cat7=2&cat8=2&cat9=1&cat10=1"
        for (catID,feedback) in FeedBack.FeedBackDepartments.sorted(by: { $0.0 < $1.0 })
        {
           if feedback.FeedBackID! != 0  // Only add if feedback option is selected.
           {
            let fback = (feedback.FeedBackID! == 0) ? "" : "\(feedback.FeedBackID!)"

        // let value = "cat\(catID)=\(fback)|\(feedback.Comments!)&"//|\(feedback.Photx64)&"
        //    print(value2)
            var value = ""
            if(feedback.Comments != "")
            {
             value = "cat\(catID)=\(fback)|\(feedback.Comments!)&"
            }
            else
            {
             value = "cat\(catID)=\(fback)&"

            }
            feedbackStr.append(value)
            }
           
            
        }
       feedbackStr = feedbackStr.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
       //  let url = NSURL(string: "\(Constant.feedbackUrl)\(feedbackStr)")
       // var request = URLRequest(url: URL(string: "\(Constant.feedbackUrl)\(feedbackStr)")!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 20)
        
       // Alamofire.request(url as! URLRequestConvertible)
        let url =  "\(Constant.feedbackUrl)\(feedbackStr)"
        print(url)
        Alamofire.request(url, method: .get , parameters: nil, encoding: URLEncoding.httpBody , headers: nil)
        //Alamofire.request( "\(Constant.feedbackUrl)\(feedbackStr)")
            .responseJSON { (response) in
              print(response.result)
            let object = JSON(response.result.value)
                print(response.result.value)
            var ReferenceID = ""
                for item in object["RESPONSE"].arrayValue
            {
                let Status = item["STATUS"].stringValue
                if (Status == "1")
                {
                ReferenceID = item["ReferenceID"].stringValue
                    let url2 =  "\(Constant.feedbackPhotoUrl)"

                    for (catID,feedback) in FeedBack.FeedBackDepartments.sorted(by: { $0.0 < $1.0 })
                    {
                        
                        if(feedback.CategoryID == 1)
                        {
                            
                        }
                        
                        if feedback.Photx64 != ""
                        {
                           // feedback.Photx64 = feedback.Photx64.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!
                            print(feedback.Photx64)
                            
                            
                    let parameters: Parameters = [
                        "FeedbackRefNo": ReferenceID,
                        "categoryID": feedback.CategoryID,
                        "Img64Bit": feedback.Photx64
                    ]
                    
                      Alamofire.request(url2, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
                     .responseJSON { (response) in
                        print(response.result)
                        print(response.result.value)


                      }
                     }
                    }
                }

            }
            if response.result.error?.localizedDescription == nil {
                
                completion(ReferenceID, nil)
                
            }else{
                completion(nil, "failure")

            }
        }
        
        

    }
    
   
    
    


}
