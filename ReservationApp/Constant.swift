//
//  Constant.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

typealias  bookingClasses = (Bussinesss:String , Economy:String, EconomyPlus: String )
typealias Details = (AirMiles:String? , ElapsedTime:String? , Equipment:String? , Meals:String? , Smoking:String?, Stops:String?)
typealias  DaysOfOperation = (Fri:Bool,Sat:Bool,Sun:Bool,Mon:Bool,Tue:Bool,Wed:Bool,Thu:Bool)


class Constant {
    
    
    static var versionCheckUrl = "http://piaawards.com/api/VerifyVersion.cfm?"

   // static var feedbackUrl = "http://crew2.piac.com.pk/FlightLogService/JSON.asmx/SaveCommentCardFeedback?"
    
    static var urlFlightAvailibilty = "http://automation.piac.aero:8092/SabreWebService.asmx/FlightAvailability_JSON?&UserName=\(Constant.UserName)&Password=\(Constant.Password)&"
    
    static var urlFlightSchedule = "http://automation.piac.aero:8092/SabreWebService.asmx/FlightSchedule_JSON?&UserName=\(Constant.UserName)&Password=\(Constant.Password)&"
    
    static var urlFlightNumber = "http://automation.piac.aero:8092/SabreWebService.asmx/FlightStatus_JSON?&UserName=\(Constant.UserName)&Password=\(Constant.Password)&"
    
    
    static var urlGetPNR = "http://automation.piac.aero:8092/SabreWebService.asmx/GetPNR_JSON?UserName=\(UserName)&Password=\(Password)&"
    
    static var urlFlightPrice = "http://automation.piac.aero:8092/SabreWebService.asmx/EBooking_GetFlights_JSON?UserName=\(UserName)&Password=\(Password)&"
    
    static var feedbackUrl = "http://piaawards.com/API/postFeedback.cfm?"
    static var feedbackPhotoUrl = "http://piaawards.com/API/PostFeedbackImage.cfm"
    
    static var urlLogin = "http://piaawards.com/API/login.cfm?"
    static var urlSignUp = "http://piaawards.com/API/signup.cfm?"
   
    static var urlSignUpAward = "http://piaawards.com/API/AwardsSignup.cfm?"
    static var urlLoginAward = "http://piaawards.com/API/MemberLogin.cfm?"
    static var urlPointsAward = "http://piaawards.com/API/getMember.cfm?"

    
    //static var urlSectors = "http://piaawards.com/api/getsector.cfm"
    static var urlSectors = "http://automation.piac.aero:8092/SabreWebService.asmx/GetAllCityPairs_JSON?&UserName=\(Constant.UserName)&Password=\(Constant.Password)&"
    
    static var UserName = "PIAiOS"
    static var Password = "PSi03Re5"
    
    
    
}
enum SectorsType {
    case origin
    case destination
}

protocol CalendarDelegate{
    func selectedDate(_ Date : String)
    func selectedDate(_ Date1 : String , Date2 : String)
}
func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: width, height: height)
}
protocol sectorSelectionDelegate{
    
    func selectedOrigin(_ origin : Origin )
    func selectedDestination(_ destination : Destination )
}

func alert(_ controller:UIViewController,title:String , Description:String) {
    
    let alert = UIAlertController(title: title, message: Description, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}




