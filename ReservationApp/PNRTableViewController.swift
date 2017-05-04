//
//  MainTableViewController.swift
//
// Copyright (c) 21/12/15. Ramotion Inc. (http://ramotion.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
//import RealmSwift
class PNRTableViewController: UITableViewController {
    
    let kCloseCellHeight: CGFloat = 120
    let kOpenCellHeight: CGFloat = 320
    
    let kRowsCount = 10
    var airlineCode = "PK"
    var cellHeights = [CGFloat]()
    
    var pnr = ""
    var paxNamesArr = [String]()
    var ticketNumArr = [String]()
    var flightDetailArr = [String]()
    var flightNo = ""
    var origin = ""
    var destination = ""
    var rowCount = 0
    
    
    var segue:String?
    var bookingDetail:BookingDetails?
    
    @IBOutlet weak var paxName: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        //populatePNRData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createCellHeightsArray()
        
        if let _ = self.segue {
            
            populateMytrips()
        
        }else{
        
            populatePNRData()

        }

    }
    
    // MARK: configure
    
    func populateMytrips(){
        
        for pass in  self.bookingDetail!.passangerPNRArray {
            
            self.paxNamesArr.append(pass.paxCount! + ": " + pass.lastName! + "_" + pass.firstName!)
        }
        
        
        for ticket in self.bookingDetail!.ticketPNRArray{
            self.ticketNumArr.append(ticket.ticketPnr!)
        }
        
        for flightDetail in self.bookingDetail!.flightsPNRArray{
            
            self.flightDetailArr.append("Flight " + flightDetail.FlightNo! + " " + flightDetail.Origin! + "-" + flightDetail.Destination!)
            self.origin = flightDetail.Origin!
            self.destination = flightDetail.Destination!
            self.flightNo = flightDetail.FlightNo!
            
            
        }
        
        
        self.rowCount = self.paxNamesArr.count
        self.tableView.reloadData()
        
    }
    
    
    func populatePNRData(){
      
        
        if pnr != "" {
            Loader.Start(self)
            GetPNRService.GetPNR(pnr, completion: { (pnr, error) in

                
        
          
                if error == nil{
                    
                    // Initilize Arrarys
                   
                    print(pnr!.passangerPNRArray.count)
                    print(pnr!.flightsPNRArray.count)
                    print(pnr!.ticketPNRArray.count)
                    
                    
                    if pnr!.passangerPNRArray.count != 0
                        //&& pnr!.flightsPNRArray.count != 0
                        && pnr!.ticketPNRArray.count != 0 {
                        
                    
                        if let user = User.sharedInstance {
                            
                            pnr!.userEmail = user.Email_Address!
                            pnr!.PNRnumber = self.pnr
                            
//                            let realm = try! Realm()
//                            try! realm.write {
//                                realm.add(pnr!)
//                            }
//                            let userdefaults = UserDefaults.standard
//                            userdefaults.set(pnr, forKey: "pnr")
                            
                            
                            
                        }
                        
                        
                        self.flightDetailArr=[]
                        self.paxNamesArr=[]
                        self.ticketNumArr=[]
                        
                        
                        for pass in  pnr!.passangerPNRArray {
                            
                            self.paxNamesArr.append(pass.paxCount! + ": " + pass.lastName! + "_" + pass.firstName!)
                        }
                        
                        
                        for ticket in pnr!.ticketPNRArray{
                            self.ticketNumArr.append(ticket.ticketPnr!)
                        }
                        
                        for flightDetail in pnr!.flightsPNRArray{
                            
                            self.flightDetailArr.append("Flight " + flightDetail.FlightNo! + " " + flightDetail.Origin! + "-" + flightDetail.Destination!)
                            self.origin = flightDetail.Origin!
                            self.destination = flightDetail.Destination!
                            self.flightNo = flightDetail.FlightNo!
                            
                            
                        }
                        
                        
                        self.rowCount = self.paxNamesArr.count
                        self.tableView.reloadData()
                        

                        
                        
                    }else{
                        
                        alert(self, title: "Message", Description: "Booking details NotFound!")
                        
                        
                    }
                 
                    
                }else{
                    
                    alert(self, title: "Error!", Description: error!)
                }
                Loader.Stop()
            })
            
        }else{
            
            alert(self, title: "Error!", Description: "Invalid PNR!")
        }
        
        
    }
    func createCellHeightsArray() {
        for _ in 0...kRowsCount {
            cellHeights.append(kCloseCellHeight)
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        guard case let cell as PNRCell = cell else {
//            return
//        }
//      
//        cell.backgroundColor = UIColor.clear
//        
//        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {
//            cell.selectedAnimation(false, animated: false, completion:nil)
//        } else {
//            cell.selectedAnimation(true, animated: false, completion: nil)
//        }
//        
//        cell.number = (indexPath as NSIndexPath).row
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! PNRCell

        cell.passenger.text = paxNamesArr[(indexPath as NSIndexPath).row]
        cell.paxNameUnfold.text = paxNamesArr[(indexPath as NSIndexPath).row]
        
        //If Ticket No for this PNR is generated
        
        if(ticketNumArr.count > 0) {
        cell.ticketNo.text = ticketNumArr[(indexPath as NSIndexPath).row]
        cell.ticketNoUnfold.text = ticketNumArr[(indexPath as NSIndexPath).row]
        cell.openNumberLabel.text = "\(airlineCode)- \(flightNo)"
        cell.originLabel.text  = origin
        cell.destinationLabel.text  = destination
       // cell.outerFlightNo.text = "\(airlineCode)- \(flightNo)"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[(indexPath as NSIndexPath).row]
    }
    
    // MARK: Table vie delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight { // open cell
            cellHeights[(indexPath as NSIndexPath).row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[(indexPath as NSIndexPath).row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
            }, completion: nil)
        
        
    }
}
