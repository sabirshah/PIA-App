//
//  MyTripsViewController.swift
//  ReservationApp
//
//  Created by Admin on 12/08/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
//import RealmSwift

class MyTripsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var tripsTable: UITableView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var trips = [String:BookingDetails]()
    
    @IBAction func openHome(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsTable.tableFooterView = UIView()

        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
    
        
        if let user = User.sharedInstance {

//            let realm = try! Realm()
//            let PNRdetails = realm.objects(BookingDetails.self).filter("userEmail == '\(user.Email_Address!)'")
//
//            if PNRdetails.count > 0 {
//                
//                for pnrDet in PNRdetails {
//                    
//                    if self.trips[pnrDet.PNRnumber!] == nil {
//                        self.trips[pnrDet.PNRnumber!] = pnrDet
//                    }
//                    self.trips[pnrDet.PNRnumber!] = pnrDet
//                    
//                }
//                
//                
//                self.message.isHidden=true
//                self.tripsTable.isHidden=false
//                
//            }else{
//                
//                self.tripsTable.isHidden=true
//                self.message.isHidden=false
//                
//
//            }
            
            
            
        }else{
            
            self.tripsTable.isHidden=true
            self.message.isHidden=false

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tripsTable.dequeueReusableCell(withIdentifier: "tripCell") as! TripsTableViewCell
        cell.pnrNumber!.text = Array(self.trips.keys)[(indexPath as NSIndexPath).row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trips.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showPnr", sender: Array(self.trips.keys)[(indexPath as NSIndexPath).row])
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    
//        let dest = segue.destination as! PNRDetailViewController
//        dest.segue = "showPnr"
//        dest.bookingDetail = self.trips[sender as! String]
        
    
    }

}
