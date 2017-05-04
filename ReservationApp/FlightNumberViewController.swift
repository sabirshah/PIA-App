//
//  FlightNumberViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/3/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FlightNumberViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {

   

    var Flights = [FlightStatusDetails]()
    
    
//    @IBAction func DoneClick(_ sender: AnyObject) {
//        self.dismiss(animated: true, completion:nil)
//            }
    override func viewDidLoad() {
        super.viewDidLoad()


       // self.title = "Flight Status"
       // if let flight = Flight{
           // BindFlightNumber(flight)

      //  }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FlightNumberTableViewCell
    
        return  BindFlightNumber(cell: cell , indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return Flights.count
    }
    
    var months = [1:"JAN",2:"FEB",3:"MAR",4:"APR",5:"MAY",6:"JUN",7:"JUL",8:"AUG",9:"SEP",10:"OCT",11:"NOV",12:"DEC"]
    
    func BindFlightNumber(cell : FlightNumberTableViewCell, _ indexPath: IndexPath  ) -> FlightNumberTableViewCell
    {
        
        let Flight = Flights[indexPath.row]
        print(Flight.ArrivalDate)
        print(Flight.DepartureDate)

        print(Flight.Carrier! + " - " + Flight.FlightNo!)
   
        let mon = Flight.DepartureDate?.components(separatedBy: "T")[0].components(separatedBy: "-")[0]
        cell.ArrDate.text = (Flight.ArrivalDate?.components(separatedBy: "T")[0].components(separatedBy: "-")[1])! + "-" + months[Int(mon!)!]!
        
        cell.ArrivalTime.text = Flight.ArrivalDate?.components(separatedBy: "T")[1]
        cell.FlightNumber.text =  Flight.Carrier! + " - " + Flight.FlightNo!
       // cell.DeptDate.text = Flight.DepartureDate?.components(separatedBy: "T")[0]
        let mon2 = Flight.DepartureDate?.components(separatedBy: "T")[0].components(separatedBy: "-")[0]
        cell.DeptDate.text = (Flight.DepartureDate?.components(separatedBy: "T")[0].components(separatedBy: "-")[1])! + "-" + months[Int(mon2!)!]!
        
        cell.DeptTime.text = Flight.DepartureDate?.components(separatedBy: "T")[1]

        
        
        
    
             cell.ActualDeptTime.text = ((Flight.ActualDepartureDate?.characters.count)! > 0) ? Flight.ActualDepartureDate?.components(separatedBy: "T")[1] : ""

           cell.ActualArrTime .text = ((Flight.ActualArrivalDate?.characters.count)! > 0) ? Flight.ActualArrivalDate?.components(separatedBy: "T")[1] : ""
        
        //If OffGate and Ongate are nil then Flight is not yet departed.
        
        if (Flight.ActualDepartureDate?.characters.count)! == 0 && (Flight.ActualArrivalDate?.characters.count)! == 0
        {
            cell.ActualDeptTime.text = cell.DeptDate.text
            cell.ActualArrTime.text = cell.ArrDate.text
            cell.Message.text = "Not yet departed."
            cell.MessageDetail1.text = "Scheduled Depart Time is : \(cell.DeptTime.text!)"
        }
        
        // If OffGate is not nill but ONGate is nill Flight departed ETA will be shown then
       // Message.text = "Flight is not yet departed"

       else if (Flight.ActualDepartureDate?.characters.count)! > 0 && (Flight.ActualArrivalDate?.characters.count) == 0
        {
            cell.ActualArrTime.text = "\(Flight.ETA!.components(separatedBy: "T")[1]) (ETA)"
            cell.Message.text = "Not yet Arrived."
            cell.MessageDetail1.text = "Estimated Time of Arrival is : \(Flight.ETA!.components(separatedBy: "T")[1])"
        }
        
        
        //If Off and OnGate are not nill then Flight Arrived
       // Message.text = "ARRIVED"
        else if (Flight.ActualDepartureDate?.characters.count)! > 0 && (Flight.ActualArrivalDate?.characters.count)! > 0
        {
            cell.Message.text = "ARRIVED"
            cell.MessageDetail1.text = "Actual Time of Arrival is : \(cell.ActualArrTime.text!)."
        }

        
        
        
        
        cell.DestinationCode.text = Flight.Destination
        cell.OriginCode.text = Flight.Origin
        
        for origin in Origin.sharedOrigins {
            
//            if  origin.Code == Flight.Origin{
//                
//                self.OriginName.text = origin.Name
//                
//            }
            
   

            if origin.Code == Flight.Destination! {
                
                print(origin.Code)
                print(origin.Name)
                print(Flight.Destination!)

                cell.DestinationName.text = origin.Name?
                    .characters.split{$0 == "("}.map(String.init)[0]
                

            }
            
            
            if origin.Code == Flight.Origin! {
                
                print(origin.Code)
                print(origin.Name)
                print(Flight.Destination!)
                
                cell.OriginName.text = origin.Name?
                    .characters.split{$0 == "("}.map(String.init)[0]
                
                
            }
            
            
        }
        
        return cell
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
