//
//  FlightNoSearchViewController.swift
//  ReservationApp
//
//  Created by Admin on 29/07/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftMoment

class FlightNoSearchViewController: UIViewController, CalendarDelegate , UITextFieldDelegate{

    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var flightNo: UITextField!
    @IBOutlet weak var DepartureDate: UIButton!
     @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var DeptDate : String?
    var Flights = [FlightStatusDetails]()
    override func viewDidLoad() {
        super.viewDidLoad()
         SearchButton.backgroundColor = UIColor(hex6: 0x004f30)
       // var pkLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
       // pkLabel.text = "PK -"
      //  flightNo.leftView = pkLabel;
        flightNo.leftViewMode = .always
        
        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
            flightNo.delegate = self
        }
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        DeptDate = dateFormatter.dateFromString(moment().format("yyyy-MM-dd"))
        
        DepartureDate.setTitle(moment().format("MMMM d, yyyy")
            , for: .normal)
        
        DeptDate = moment().format("yyyy-MM-dd")
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)        // Do any additional setup after loading the view.
       
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.characters.count + string.characters.count - range.length
        
        return newLength <= getMaxLength(textField) // Bool
    }
    
    func getMaxLength(_ textField : UITextField) -> Int {
        
        let type = textField.tag
        
        switch (type) {
        case 1 : return 4
            
        default : return 20
            
        }
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func HomeClick(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
    }

    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func selectedDate(Date: NSDate) {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
//        DepartureDate.text = dateFormatter.stringFromDate(Date)
//        DeptDate = Date
//    }
//    
//    func selectedDate(Date1: NSDate, Date2: NSDate) {
//    }

    @IBAction func DepartureClicked(_ sender: Any) {
         self.performSegue(withIdentifier: "DateSegue2", sender: nil)
    }

 
    @IBAction func search(_ sender: AnyObject) {
        
        if self.flightNo.text != "" {
            Loader.Start(self)

            FlightScheduleService.getFlightNumberDetailAsync(flightNo.text!, departureDate: moment(DeptDate!)!.format("yyyy-MM-dd")){ (flights, error) in
                
                if error == nil {
                    
                    self.Flights = flights!
                    self.performSegue(withIdentifier: "fScheduleSegue", sender: nil)
                    
                }
                else
                {
                    alert(self, title: "Error", Description: error!)
                    
                }
                Loader.Stop()

                
            }
 
        }else{
            alert(self, title: "Error", Description: "Please enter the Flight Number")
        }
        
        
    }
    
    func selectedDate(_ Date: String) {

        
        self.DepartureDate.setTitle(Date , for: .normal)
        self.DeptDate = Date
    }
    func selectedDate(_ Date1: String, Date2: String) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "fScheduleSegue"
        {
           let dest = segue.destination as! FlightNumberViewController
           dest.Flights = self.Flights
        }
        
        if segue.identifier == "DateSegue2" {
            let dest = segue.destination as! CalenderViewController
            dest.delegate = self
            dest.TripType = 1
                
                
        }

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
