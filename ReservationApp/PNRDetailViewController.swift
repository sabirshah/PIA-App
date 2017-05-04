//
//  PNRDetailViewController.swift
//  ReservationApp
//
//  Created by Nano Degree on 06/12/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftMoment

class PNRDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var PassengerView: UIView!
    
    @IBOutlet weak var ContentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var TicketWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var PassengerStackView: UIStackView!
    @IBOutlet weak var PassengerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var SectorsTableView: UITableView!
    @IBOutlet weak var PNRName: UILabel!
    
    @IBOutlet weak var TicketStackView: UIStackView!
    @IBOutlet weak var TicketCount: UILabel!
    
    @IBOutlet weak var TicketViewHeight: NSLayoutConstraint!
    @IBOutlet weak var TicketsView: UIView!
    
    var pnr = ""
    var booking: BookingDetails?
    
    var flightNo = ""
    var origin = ""
    var destination = ""
    var rowCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        PNRName.text = self.pnr
     
        //Booking Details
        
        
       //Passenger Names
       for passenger in (booking?.passangerPNRArray)!
       {
        
        
        let range = passenger.firstName!.range(of: " ", options: String.CompareOptions.backwards, range: nil, locale: nil)
        let firstName = passenger.firstName!.substring(with: (passenger.firstName!.startIndex) ..< (passenger.firstName!.characters.index((range!.lowerBound) , offsetBy: 0))  )
        
         let title =  passenger.firstName!.replacingOccurrences(of: firstName , with: "")
        
        
        var customFont = UIFont(name: "HelveticaNeue", size: CGFloat(16))!
         var label = UILabel(frame: CGRect(x: CGFloat(91), y: CGFloat(15), width: CGFloat(TicketWidth.constant), height: CGFloat(25)))
        if (title.replacingOccurrences(of:" " , with: "") == "INF")
        {
            label.text = " \(firstName)/\(passenger.lastName!) \(title)"
        }
        else
        {
        label.text = "\(title). \(firstName) \(passenger.lastName!)"
        }
        label.font = customFont
        label.numberOfLines = 1
        label.baselineAdjustment = .alignBaselines
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 10.0 / 12.0
        label.clipsToBounds = true
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .left

        
        //var label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 21))
        //label.text = passenger.firstName! + " " + passenger.lastName!
        
        //label.font = UIFont(name: "HelveticaNeue", size: label.font.pointSize)

        
        //label.textAlignment = NSTextAlignment.center
        PassengerStackView.addArrangedSubview(label)
        PassengerViewHeight.constant += 18
        ContentViewHeight.constant += 18
        }
        
        //Ticket details
        var tCount = 0
        for ticket in (booking?.ticketPNRArray)!
        {
            tCount += 1
            var customFont = UIFont(name: "HelveticaNeue", size: CGFloat(14))!
            var label = UILabel(frame: CGRect(x: CGFloat(91), y: CGFloat(15), width: CGFloat(TicketWidth.constant - 2), height: CGFloat(25)))
            label.text = ticket.ticketPnr
            label.font = customFont
            label.numberOfLines = 1
            label.baselineAdjustment = .alignBaselines
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 10.0 / 12.0
            label.clipsToBounds = true
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.black
            label.textAlignment = .left

            TicketStackView .addArrangedSubview(label)
            TicketViewHeight.constant += 18
            ContentViewHeight.constant += 18

        }
        TicketCount.text = "No of Tickets: \(tCount)"
        
   }

    override func viewDidAppear(_ animated: Bool) {
          // SectorsTableView.frame = CGRect(x: SectorsTableView.frame.origin.x,y: SectorsTableView.frame.origin.y,width: SectorsTableView.frame.size.width, height: SectorsTableView.frame.size.height+(CGFloat((booking?.flightsPNRArray.count)!) * CGFloat(400)));
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: 375, height: 2000)
    }
       
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(booking?.flightsPNRArray.count)
        return (booking?.flightsPNRArray.count)!
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableViewHeight.constant += 120
        ContentViewHeight.constant += 120

       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PNRTableViewCell
       let flightSector = (booking?.flightsPNRArray[indexPath.row])! as FlightPNR

        cell.FlightNo.text = flightSector.Carrier! + "-" + flightSector.FlightNo!
        cell.FlightDate.text = moment(flightSector.DepartureDate!
            )?.format("EEEE, MMM dd")
        cell.OriginCode.text = flightSector.Origin
        
        for origin in Origin.sharedOrigins
        {
            if(origin.Code == flightSector.Origin)
            {
                
                let range = origin.Name?.range(of: "(", options: String.CompareOptions.backwards, range: nil, locale: nil)
                let originName = origin.Name?.substring(with: origin.Name!.startIndex ..< (origin.Name?.characters.index((range?.lowerBound)! , offsetBy: 0))!  )
                
                cell.OriginName.text = originName
                break
            }
            else
            {
                cell.OriginName.text = ""
            }
        }
        cell.DestinationCode.text = flightSector.Destination
        for origin in Origin.sharedOrigins
        {
            if(origin.Code == flightSector.Origin)
            {
                for  destination in origin.Destinations
                {
                    if(destination.Code == flightSector.Destination)
                    {
                        let range = destination.Name?.range(of: "(", options: String.CompareOptions.backwards, range: nil, locale: nil)
                        let DestinationName = destination.Name?.substring(with: destination.Name!.startIndex ..< (destination.Name?.characters.index((range?.lowerBound)! , offsetBy: 0))!  )
                        
                        cell.DestinationName .text = DestinationName
                        break
                    }
                    else
                    {
                        cell.DestinationName .text = ""
                    }
                   
                }
              
                break
            }
            else
            {
                cell.DestinationName.text = ""
            }
        }

        
        cell.DepartTime.text =  moment(flightSector.DepartureDate!
)?.format("HH:mm a")
        print(flightSector.ArrivalDate!)
        cell.ArrivalTime.text =  moment(flightSector.ArrivalDate!
            )?.format("HH:mm a")

        cell.FlightClass.text = "Class: " + getClass(classCode: flightSector.ReservedClass!)
        cell.FlightStatus.text = "Status: " + getRsrvStatus(rsvSts: flightSector.ReservedStatus!)
        return cell
    }
    
    func getClass(classCode:String) -> String
    {
        if (classCode == "E" || classCode == "H" || classCode == "I" || classCode == "K" || classCode == "L") {
            
            return "Economy"
            }
        else if (classCode == "M" || classCode == "N" || classCode == "O" || classCode == "T" || classCode == "U") {
            return  "Economy"
        }
        else if (classCode == "V" || classCode == "Y" || classCode == "Z" ) {
            return  "Economy"
        }
        else if (classCode == "A" || classCode == "B" || classCode == "C" || classCode == "D" || classCode == "G" || classCode == "J" || classCode == "S") {
            return  "Business"
        }
        else if (classCode == "P" || classCode == "Q" || classCode == "R" || classCode == "W" || classCode == "X" ) {
            return  "Economy+"
        }
        else{
        return ""
        }
    }
    
    
    func getRsrvStatus(rsvSts:String) -> String {
    
    if (rsvSts == "RR") {
    
    return "Re-Confirmed"
    }
    else if (rsvSts == "HK") {
    
    return "Confirmed"
    }
    else if (rsvSts == "WL") {
    
    return "Wait-listed";
    }
    else if (rsvSts ==  "WK")
    {
        return "Cancelled due to Schedule Change"
    }
    else if (rsvSts ==  "SC")
    {
        return "Confirmed with Change in Schedule"
    }
    else {
    
     return "Not Confirmed";
     }
 }

    //dngjpj
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
  
    
}
