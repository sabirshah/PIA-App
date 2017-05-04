//
//  SabreViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 9/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
class SabreViewController: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    var origin = ""
    var destination = ""
    var departureDate = ""
    
    var origin2 = ""
    var destination2 = ""
    var departureDate2 = ""
    
    var origin3 = ""
    var destination3 = ""
    var departureDate3 = ""
    
    var origin4 = ""
    var destination4 = ""
    var departureDate4 = ""
    
    var origin5 = ""
    var destination5 = ""
    var departureDate5 = ""
    
    var origin6 = ""
    var destination6 = ""
    var departureDate6 = ""
    
    
    var returnDate = ""
    var numAdults = ""
    var numChildren = "0"
    var numInfants = "0"
//    var isMultiCity = false
    var journeySpan = "OW"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        let url = NSURL (string: "https://wl-prod.havail.sabresonicweb.com/SSW2010/PKPK/webqtrip.html?origin=KHI&destination=ISB&lang=en_GB&departureDate=2016-9-27&journeySpan=RT&returnDate=2016-10-09&alternativeLandingPage=true&numAdults=4&numChildren=2&numInfants=2");
        
        if journeySpan == "MC"
        {
          //  https://wl-prod.sabresonicweb.com/SSW2010/PKPK/webqtrip.html?alternativeLandingPage=true&lang=en&origin=KHI&destination=ISB&departureDate=2017-01-26&origin2=ISB&destination2=LHE&departureDate2=2017-01-27&origin3=ISB&destination3=KHI&departureDate3=2017-02-02&journeySpan=MC&cabin=ECONOMY&numAdults=1&YOUTH=0&numChildren=0&numInfants=0&promoCode=&callbacktype=formmulticity&searchHotels=false&searchCars=false
        
            var _url = "https://wl-prod.sabresonicweb.com/SSW2010/PKPK/webqtrip.html?alternativeLandingPage=true&lang=en&origin=\(origin)&destination=\(destination)&departureDate=\(departureDate)&"
                
                if origin2 != ""
                {
                _url += "origin2=\(origin2)&destination2=\(destination2)&departureDate2=\(departureDate2)&"
                
                }
                if origin3 != ""
                {
                _url += "origin3=\(origin3)&destination3=\(destination3)&departureDate3=\(departureDate3)&"
                }
                if origin4 != ""
                {
                _url += "origin4=\(origin4)&destination4=\(destination4)&departureDate4=\(departureDate4)&"
                }
                if origin5 != ""
                {
                   _url += "origin5=\(origin5)&destination5=\(destination5)&departureDate5=\(departureDate5)&"
                }
                if origin6 != ""
                {
               _url += "origin6=\(origin6)&destination6=\(destination6)&departureDate6=\(departureDate6)&"
                }
                var url = URL(string:  _url +  "journeySpan=MC&cabin=ECONOMY&numAdults=\(numAdults)&YOUTH=0&numChildren=\(numChildren)&numInfants=\(numInfants)&promoCode=&callbacktype=formmulticity&searchHotels=false&searchCars=false");

            
            
            let requestObj = URLRequest(url: url!);
            webView.loadRequest(requestObj);

        
        }
        
        else if journeySpan == "RT" {
        let url = URL (string: "https://wl-prod.havail.sabresonicweb.com/SSW2010/PKPK/webqtrip.html?origin=\(origin)&destination=\(destination)&lang=en_GB&departureDate=\(departureDate)&journeySpan=RT&returnDate=\(returnDate)&alternativeLandingPage=true&numAdults=\(numAdults)&numChildren=\(numChildren)&numInfants=\(numInfants)");
        
        let requestObj = URLRequest(url: url!);
        webView.loadRequest(requestObj);
        }
        else if journeySpan == "OW" {
            let url = URL (string: "https://wl-prod.havail.sabresonicweb.com/SSW2010/PKPK/webqtrip.html?origin=\(origin)&destination=\(destination)&lang=en_GB&departureDate=\(departureDate)&journeySpan=OW&alternativeLandingPage=true&numAdults=\(numAdults)&numChildren=\(numChildren)&numInfants=\(numInfants)");
            
            let requestObj = URLRequest(url: url!);
            webView.loadRequest(requestObj);
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();

        webView.scrollView.contentInset = UIEdgeInsets.zero;
    }
    
    @IBAction func Done(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)

    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
       // Loader.Start(self)

    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
       // Loader.Stop()
    }
}
