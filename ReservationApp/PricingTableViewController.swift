//
//  PricingTableViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/5/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

    import UIKit
    import FoldingCell
    import SwiftMoment
    
    class PricingTableViewController:UIViewController, UITableViewDelegate,UITableViewDataSource {
        
        var dayofOperation : String?
        
        @IBOutlet weak var destination: UILabel!
        @IBOutlet weak var origin: UILabel!
        @IBOutlet var tabelView: UITableView!
        let kCloseCellHeight: CGFloat = 87
        let kOpenCellHeight: CGFloat = 330
        
        var kRowsCount = 20
        var cellHeights = [CGFloat]()
        
        var Origin1 : String?
        var Origin2 :String?
        var Destination1 : String?
        var Destination2 : String?
        var sectionCount : Int?
        var bookingClass: Int?
        var rowCountSectionOne : Int?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let origin = Origin1{
                self.origin.text = origin
            }
            if let dest = Destination1{
                self.destination.text = dest
            }
//            let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
//            tabelView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
//
            createCellHeightsArray()
//            self.tabelView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
            
       
            
            //        let spinner:UIActivityIndicatorView = UIActivityIndicatorView()
            //        spinner.activityIndicatorViewStyle = .Gray
            //        spinner.center = view.center
            //        spinner.hidesWhenStopped = true
            //        view.addSubview(spinner)
            //        spinner.startAnimating()
            //
            
            
            
        }
        
        // MARK: configure
        func createCellHeightsArray() {
            for _ in 0...kRowsCount {
                cellHeights.append(kCloseCellHeight)
            }
        }
        
        // MARK: - Table view data source
       // var sectionTitleArr = ["KHI --> ISB", "ISB -- > KHI",]
        
        
//         func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        // Here, we use NSFetchedResultsController
//        // And we simply use the section name as title
//               // Dequeue with the reuse identifier
//       
//            let cell = self.tabelView.dequeueReusableHeaderFooterViewWithIdentifier("TableSectionHeader")
////        let header = cell as! TableSectionHeader
//            
//            guard let headerView = NSBundle.mainBundle().loadNibNamed("TableSectionHeader", owner: nil, options: nil).first as? TableSectionHeader else {
//                return nil
//           }
//            
//              //  let backgroundView = UIView(frame: header.bounds)
//               // backgroundView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
//          
//            
//            // configure header as normal
//           // headerView.backgroundColor = UIColor.redColor()
//
//            
//            headerView.OriginLabel.text = ((section == 0) ? Origin1 : Origin2)
//            headerView.DestinationLabel.text = ((section == 0) ? Destination1 : Destination2)
//        return header
//        }
        
//         func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//            
//            if view.isMemberOfClass(TableSectionHeader) {
//                view.backgroundColor = UIColor.whiteColor()
//            }
//
//        }
        
         func numberOfSections(in tableView: UITableView) -> Int {
            return self.sectionCount!
        }
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 0 {
                return  fpFlightPaths.sharedfpFlightPaths.count
            }
                
            else if section == 1 {
                return 0         }
            else
            {
                return 0
            }
            
        }
        
        
//         func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 60
//        }
        
        
         func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
            guard case let cell as PricingTableViewCell = cell else {
                return
            }
            
            cell.backgroundColor = UIColor.clear
            
            if cellHeights[(indexPath as NSIndexPath).row] == kCloseCellHeight {
                cell.selectedAnimation(false, animated: false, completion:nil)
            } else {
                cell.selectedAnimation(true, animated: false, completion: nil)
            }
            
            cell.number = (indexPath as NSIndexPath).row
        }
        
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            
            
            let cellIdentifier = "FoldingCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as! PricingTableViewCell
            // Configure the cell...
            if   fpFlightPaths.sharedfpFlightPaths.count > 0 {
                cell.CloseDepartTime?.text = "Departure: " + fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].DepartureDate!.components(separatedBy: "T")[1]
                
                cell.CloseArrTime?.text = "Arrival : " + fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].ArrivalDate!.components(separatedBy: "T")[1]

            
                let FlightNumber = "\(fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].Carrier!) - \(fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].FlightNo!)"
                cell.OpenFlightNo!.text = FlightNumber
                cell.CloseFlightNo!.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].Origin! + " - " + fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].Destination!

              
                cell.Origin.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].Origin!
                cell.Destination.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].Destination!
                
                cell.DepartureDate.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].DepartureDate!.components(separatedBy: "T")[0]
                 cell.ArrivalDate.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].ArrivalDate!.components(separatedBy: "T")[0]
                
        
                cell.Meal.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].details!.Meals
                cell.Equipment.text = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].details!.Equipment
                
                let Bussiness = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].bookingclasses!.Bussinesss
                let EconomyPlus = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].bookingclasses!.EconomyPlus
                let Economy = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].flights[0].bookingclasses!.Economy
                
                let BussinessFare = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].BusinessFare
                let EconomyFare = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].EconomyFare
                let EconomyPlusFare = fpFlightPaths.sharedfpFlightPaths[(indexPath as NSIndexPath).row].EconomyPlusFare
                
                if(self.bookingClass == 0)
                {
                 cell.ClosePrice.text = EconomyFare
                }
                else   if(self.bookingClass == 1)
                {
                    cell.ClosePrice.text = EconomyPlusFare
                }
                else   if(self.bookingClass == 2)
                {
                    cell.ClosePrice.text = BussinessFare
                }
                
                 var seatavailibiltyString = "" 
                if Bussiness == "1" && self.bookingClass != 2
                {
                   seatavailibiltyString = " Bussiness: Available"

                }
                if EconomyPlus == "1" && self.bookingClass != 1
                {
                    seatavailibiltyString += " EconomyPlus: Available"
                }
                if Economy == "1" && self.bookingClass != 0
                {
                     seatavailibiltyString += " Economy: Available"
                }
                
                
               
                
                if( Bussiness == "1" || EconomyPlus == "1" || Economy == "1" )
                {
                     cell.SeatAvailibility.text = seatavailibiltyString
                }
               
               }
//                cell.EquipmentLabel.text = FlightPath.sharedDayWiseFlights[dayofOperation!]![indexPath.row].flights[0].details!.Equipment!
//                cell.MealLabel .text = FlightPath.sharedDayWiseFlights[dayofOperation!]![indexPath.row].flights[0].details!.Meals!
//                
//                
//            }
            // cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
            // cell.thumbnailImageView.layer.cornerRadius=20.0
            // cell.thumbnailImageView.clipsToBounds=true;
           
           
            return cell
            
            
            // let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath)
            
            // return cell
        }
        
//        func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//            
//                origin.text = ((section == 0) ? Origin1 : Origin2)
//                destination.text = ((section == 0) ? Destination1 : Destination2)
//               
//            
//            
//            return ""
//        }

        
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return cellHeights[(indexPath as NSIndexPath).row]
        }
        
        // MARK: Table vie delegate
        
         func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let cell = tableView.cellForRow(at: indexPath) as! PricingTableViewCell
            
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
