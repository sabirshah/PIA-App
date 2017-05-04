//
//  FeedbackDashViewController.swift
//  ReservationApp
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import WillowTreeScrollingTabController
import SwiftMoment

class FeedbackDashViewController: UIViewController {

    
    @IBOutlet weak var SubmitButton: UIButton!
    @IBOutlet weak var scrollContainer: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var scrollTab = ScrollingTabController()
    
    var Destination:String = "LHE"
    var Origin:String = "KHI"
    var DepartureDate:String = ""
    var NumberOfAdults:String = ""
    var NumberOfChildren:String = ""
    var NumberOfInfants:String = ""
    var viewControllers: [UIViewController] = []
    
    
    @IBAction func openHome(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController().rearViewRevealWidth = 200
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if FeedBack.FeedBackDepartments.count > 0 {

            SubmitButton.isEnabled = true
        }
        else
        {
            
        }
        
    }
    
    @IBAction func DoneClick(_ sender: AnyObject) {
        
    }
    
    @IBAction func feedback(_ sender: UIButton) {
        let title = sender.titleLabel
        if title!.text == "MISCELLANEOUS" {
            self.performSegue(withIdentifier: "feedback", sender:  title!.text)
        }else if title!.text == "HOME" {
            
            let storyboard =  UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
            present(controller, animated: true,completion: nil)
            
            
        }
        else{
            
            
       
            self.performSegue(withIdentifier: "FeedBackTabsSegue", sender: title!.text)
            
             
            
        }
        
    }
    
    @IBAction func send(_ sender: AnyObject) {
        
     
          var feedbackGiven = false
          for (_,feedback) in FeedBack.FeedBackDepartments
            {
               if ( feedback.FeedBackID! > 0 || feedback.Comments != "" )
                {
                    feedbackGiven = true
                    break
                }
            }
        
        
        
        if feedbackGiven == true {

            Loader.Start(self)
            
   
            FeedbackServices.submitFeedback()   {    (response, error) in
                
                if error == nil{
                    FeedBack.FlightNo = ""
                    FeedBack.FlightDT = ""
                    FeedBack.FirstName = ""
                    FeedBack.Email = ""
                    FeedBack.PhoneC = ""
                    FeedBack.PhoneH = ""
                    
                    
                    for i in 1...10
                    {
                        FeedBack.FeedBackDepartments[i] = FeedBackDepartment.init(CategoryID: i , FeedBackID: nil, Comments: "", Photx64: "")
                    }
                    
                    
                    self.performSegue(withIdentifier: "feedbackComplete1", sender: nil)
                    
                    // alert(self, title: "Message!", Description: "Feedback Sent")
                }else{
                    alert(self, title: "Error!", Description: error!)
                    
                }
                Loader.Stop()
            }        }else{
            alert(self, title: "Message!", Description: "Please provide feedback first.")
        }
        
    }
//    func buildViewControllers() {
//        
//        var now = moment()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        for i in 1...7 {
//            
//            if i > 1
//            {
//                // now = now.add(((i-1) * 24).hours)
//                now = now.add(1.days)
//            }
//            
//            
//            let scheduleViewcontroller = storyboard.instantiateViewController(withIdentifier: "ScheduleDetail") as! MainTableViewController
//            // let flightStatusViewcontroller = storyboard.instantiateViewControllerWithIdentifier("ScheduleDetail") as! MainTableViewController
//            // scheduleViewcontroller.tableView.reloadData()
//            
//            scheduleViewcontroller.tabBarItem.title = "\(now.monthName) \(now.day) "
//            scheduleViewcontroller.dayofOperation = "\(now.weekdayName.substring(to: now.weekdayName.characters.index(now.weekdayName.startIndex, offsetBy: 3)))"
//            //flightStatusViewcontroller.tabBarItem.title = "Flight No"
//            
//            viewControllers.append(scheduleViewcontroller)
//        }
    
        
        
        //now + 1
        
   // }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FeedBackTabsSegue" {
            let dest = segue.destination as! FeedbackTabViewController
            dest.title = sender as? String
            
            switch(sender as! String) {
            case "  AIRPORT CHECK-IN" :
                dest.department_id = 1
            case "BAGGAGE HANDLING" :
                dest.department_id = 4
            case "CABIN CREW COURTESY" :
                dest.department_id = 7
            case "CABIN COMFORT" :
                dest.department_id = 10
            case "RESERVATION" :
                dest.department_id = 2
            case "TRANSIT SERVICES" :
                dest.department_id = 5
            case "FOOD AND BEVERAGES" :
                dest.department_id = 8
            case "MISCELLANEOUS" :
                dest.department_id = 11
            case "LOUNGE FACILITIES" :
                dest.department_id = 3
            case "IN-FLIGHT ENTERTAINMENT" :
                dest.department_id = 6
            case "TOILETS" :
                dest.department_id = 9
            default :
                dest.department_id = 0

            }
            
        }else if segue.identifier == "feedback" {
            let dest = segue.destination as! FeedbackFormViewController
            dest.title = sender as? String
        }
        
    }
}
