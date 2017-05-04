

import UIKit
import FoldingCell
import SwiftMoment

class ScheduleDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var SearchType : Int?
    var Origin: String?
    var Destination: String?
    var flights1:[FlightPath]?
    var flights2:[FlightPath]?
    
    var flights:[FlightPath]?
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var table: UITableView!

   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flights = flights1
        
       if SearchType == 1
       {
        HeaderLabel.isHidden = true
        segmentedControl.setTitle(Origin! + "  -  " + Destination!
, forSegmentAt: 0)
        segmentedControl.setTitle(Destination! + "  -  " + Origin!
, forSegmentAt: 1)

        }
        else
       {
        HeaderLabel.text = Origin! + "   -   " + Destination!
        HeaderLabel.isHidden = false
        segmentedControl.isHidden = true
        }
        
        
    }
    
    @IBAction func IndexChanged(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            flights = flights1
            
        case 1:
            flights = flights2
            
            
        default:
            break;
        }
        
     table.reloadData()
        
        
        
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = flights?.count

        
        return count!
    }
    var months = [1:"JAN",2:"FEB",3:"MAR",4:"APR",5:"MAY",6:"JUN",7:"JUL",8:"AUG",9:"SEP",10:"OCT",11:"NOV",12:"DEC"]

 
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath) as! ScheduleDetailTableViewCell
        // Configure the cell...
        if   (flights?.count)! > 0 {
            let mon = flights![(indexPath as NSIndexPath).row].flights[0].DepartureDate!.components(separatedBy: "T")[0].components(separatedBy: "-")[0]
            cell.DepartureDate.text = flights![(indexPath as NSIndexPath).row].flights[0].DepartureDate!.components(separatedBy: "T")[0].components(separatedBy: "-")[1] + "-" +  months[Int(mon)!]!
            
            
            let mon2 = flights![(indexPath as NSIndexPath).row].flights[0].ArrivalDate!.components(separatedBy: "T")[0].components(separatedBy: "-")[0]
            cell.ArrivalDate.text = flights![(indexPath as NSIndexPath).row].flights[0].ArrivalDate!.components(separatedBy: "T")[0].components(separatedBy: "-")[1] + "-" +  months[Int(mon2)!]!
            
            cell.DepartureTime?.text = flights![(indexPath as NSIndexPath).row].flights[0].DepartureDate!.components(separatedBy: "T")[1]
            cell.ArrivalTime?.text = flights?[(indexPath as NSIndexPath).row].flights[0].ArrivalDate!.components(separatedBy: "T")[1]
            
          //  cell.DeptTimeOpen.text = cell.DeptTime?.text
            //cell.ArrTimeOpen.text = cell.ArrTime?.text

       
            let FlightNumber = "\(flights![(indexPath as NSIndexPath).row].flights[0].Carrier!) - \(flights![(indexPath as NSIndexPath).row].flights[0].FlightNo!)"
           cell.FlightNumber.text = FlightNumber
            
            if !(flights![(indexPath as NSIndexPath).row].flights[0].Carrier?.lowercased().contains("pk"))!
            {
             cell.CarrierImage.isHidden  = true
            }
            
            cell.Aircraft.text = flights?[(indexPath as NSIndexPath).row].flights[0].details!.Equipment!
            //cell.MealLabel .text = FlightPath.sharedDayWiseFlights[dayofOperation!]![(indexPath as NSIndexPath).row].flights[0].details!.Meals!

            
                   }
        // cell.thumbnailImageView?.image = UIImage(named: restaurantImages[indexPath.row])
        // cell.thumbnailImageView.layer.cornerRadius=20.0
        // cell.thumbnailImageView.clipsToBounds=true;
        return cell

        
       // let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath)

       // return cell
    }
    
   
    
    // MARK: Table vie delegate
    

}
