//
//  ScheduleSearchViewController.swift
//  ReservationApp
//
//  Created by Admin on 29/07/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import SwiftMoment
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

class ScheduleSearchViewController: UIViewController,sectorSelectionDelegate,CalendarDelegate {


    
    @IBOutlet weak var OriginCodeText: UILabel!
    @IBOutlet weak var DestinationCodeText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var DateText: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var DestinationText: UILabel!
    @IBOutlet weak var OriginText: UILabel!
    var TapButton : String?
    var DepartureDate : String?
    var ArrivalDate : String?
    var onlyDep:String?
    var Flights1 = [FlightPath]()
    var Flights2 = [FlightPath]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.onlyDep = moment().format("MMMM d, yyyy")
        self.DepartureDate = moment().format("MMMM d, yyyy")
        self.ArrivalDate = moment().add(2.days).format("MMMM d, yyyy")
        
        DateText.text = "\(self.DepartureDate!) - \(self.ArrivalDate!)"
        
       
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }

        
        let tapGesture1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.OriginClick(_:)))
        tapGesture1.numberOfTapsRequired = 1
        self.OriginText.isUserInteractionEnabled =  true
        self.OriginText.addGestureRecognizer(tapGesture1)
        
        
        
        let tapGesture2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DestinationClick(_:)))
        tapGesture2.numberOfTapsRequired = 1
        self.DestinationText.isUserInteractionEnabled =  true
        self.DestinationText.addGestureRecognizer(tapGesture2)
        
        
        let tapGesture3: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DestinationClick(_:)))
        tapGesture3.numberOfTapsRequired = 1
        self.DestinationCodeText.isUserInteractionEnabled =  true
        self.DestinationCodeText.addGestureRecognizer(tapGesture3)
        
        
        
        let tapGesture4: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.OriginClick(_:)))
        tapGesture4.numberOfTapsRequired = 1
        self.OriginCodeText .isUserInteractionEnabled =  true
        self.OriginCodeText.addGestureRecognizer(tapGesture4)

        
        let tapGesture5: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DateClick(_:)))
        tapGesture5.numberOfTapsRequired = 1
        self.DateText.isUserInteractionEnabled =  true
        self.DateText.addGestureRecognizer(tapGesture5)
        

    }
    
    func OriginClick(_ recognizer: UITapGestureRecognizer) {
        TapButton = "Origin";
        self.performSegue(withIdentifier: "SectorsSegue", sender: nil)
        
    }
    func DestinationClick(_ recognizer: UITapGestureRecognizer) {
        TapButton = "Destination";
        self.performSegue(withIdentifier: "SectorsSegue", sender: nil)
        
    }
    
    func DateClick(_ recognizer: UITapGestureRecognizer) {
        
        self.performSegue(withIdentifier: "DateSegue", sender: nil)
        
    }
    @IBAction func IndexChanged(_ sender: UISegmentedControl) {
        
        
        if sender.selectedSegmentIndex == 0  ||  sender.selectedSegmentIndex == 1 {
            DateText.text = self.onlyDep!
           
            if( sender.selectedSegmentIndex == 1)
            {
                DateText.text = "\(self.DepartureDate!) - \(self.ArrivalDate!)"
                
            }
            
        }
      
        
        
    }
    func selectedDate(_ Date: String) {
        self.onlyDep = Date
        self.DepartureDate = self.onlyDep
            DateText.text = Date
        
    }
    
    func selectedDate(_ Date1: String, Date2: String) {
        
        self.ArrivalDate = Date2
        self.DepartureDate = Date1
        DateText.text = "\(self.DepartureDate!) - \(self.ArrivalDate!)"
        
    }
    
    func selectedOrigin(_ origin : Origin) {
        print("\(origin.Code)  \(origin.Name)")
        
        
            self.OriginText.text = origin.Name?
                .characters.split{$0 == "("}.map(String.init)[0]
            self.OriginCodeText.text = origin.Code
            self.DestinationText.text = "Destination"
            self.DestinationCodeText.text = ""
            
        
    }
    
    
    func selectedDestination(_ destination : Destination) {
                   print("\(destination.Code)  \(destination.Name)")
            self.DestinationText.text = destination.Name?
                .characters.split{$0 == "("}.map(String.init)[0]
            self.DestinationCodeText.text = destination.Code
        
        
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
   
    @IBAction func search(_ sender: AnyObject) {
    
        Loader.Start(self)
        
        let now =  moment().add(1.days)
        print(now.format("yyyy-MM-dd"))
        var Date1:String?
        var Date2 = ""
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            Date1 = moment((self.DepartureDate)!, dateFormat: "MMMM d,yyyy", timeZone: TimeZone.current, locale: Locale.current)!.format("yyyy-MM-dd")
        case 1:
        
            Date1 = moment(self.DepartureDate!, dateFormat: "MMMM d,yyyy", timeZone: TimeZone.current, locale: Locale.current)!.format("yyyy-MM-dd")
print(Date1)
            Date2 = moment(self.ArrivalDate!, dateFormat: "MMMM d,yyyy", timeZone: TimeZone.current, locale: Locale.current)!.format("yyyy-MM-dd")

            
        default:
            break;
        }

        
        
        
        FlightScheduleService.getFlightScheduleAsync(Date1!, returnDate: "", origin: OriginCodeText.text!, destination: DestinationCodeText.text!) { (flights, error) in
            if error == nil {
                if self.segmentedControl.selectedSegmentIndex == 1
                {
                FlightScheduleService.getFlightScheduleAsync(Date2, returnDate: "", origin:self.DestinationCodeText.text! , destination: self.OriginCodeText.text!) { (flights2, error) in
                    if error == nil {

                
               if flights?.count > 0 || flights2?.count > 0
               {
                self.Flights1 = flights!
                self.Flights2 = flights2!
                Loader.Stop()
                self.performSegue(withIdentifier: "ScheduleSegue", sender: nil)
                
               }
                else
               {
                Loader.Stop()

                 alert(self, title: "Message", Description: "No flights found.")
                }
                //  (self.viewControllers[0] as! MainTableViewController).tableView.reloadData()
              }
             }
            }
                else
                {
                    if flights?.count > 0
                    {                Loader.Stop()

                        self.Flights1 = flights!
                        self.performSegue(withIdentifier: "ScheduleSegue", sender: nil)
                        
                    }
                    else
                    {
                        Loader.Stop()

                        alert(self, title: "Message", Description: "No flights found.")
                    }

                }
            }
            else
            {
                Loader.Stop()

                alert(self, title: "Error", Description: error!)
            }

            
        }

     
    }

    @IBAction func HomeClick(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SectorsSegue2" {
            let dest = segue.destination as! SectorsViewController
            dest.delegate = self
            if TapButton == "Origin"
            {
         //       dest.sectorType = SectorsType.Origin
            }
            else if (TapButton == "Destination") && (OriginText.text != "")
            {
                let index = Origin.OriginNames.index(of: OriginText.text!)
                dest.SelectedOrigin = Origin.sharedOrigins[index!]
                dest.sectorType = SectorsType.destination
            }
            
        }
        else
            
            if segue.identifier == "SectorsSegue" {
                let dest = segue.destination as! SectorsViewController
                dest.delegate = self
                if TapButton == "Origin"
                {
                    dest.sectorType = SectorsType.origin
                }
                else if TapButton == "Destination"
                {
                    
                    print(OriginText.text! + "(\(OriginCodeText.text!))")
                    let index = Origin.OriginNames.index(of: OriginText.text! + "(\(OriginCodeText.text!))")!
                    dest.SelectedOrigin = Origin.sharedOrigins[index]
                    dest.sectorType = SectorsType.destination
                }
            }
            else if segue.identifier == "DateSegue" {
                let dest = segue.destination as! CalenderViewController
                dest.delegate = self
                
                switch segmentedControl.selectedSegmentIndex
                {
                case 0:
                    dest.TripType = 1
                    dest.DepartDate = self.onlyDep
                case 1:
                    
                    dest.TripType = 2
                    dest.DepartDate = self.DepartureDate
                               default:
                    break;
                }
                
        }

        if segue.identifier == "ScheduleSegue"{
            
         
            
           // let dateFormatter = NSDateFormatter()
          //  dateFormatter.dateFormat = "yyyy-MM-dd"
          //  let selectedDate = dateFormatter.stringFromDate(DepartureDate!)
            let controller = segue.destination as! ScheduleDetailViewController

            switch segmentedControl.selectedSegmentIndex
            {
            case 0:
               controller.SearchType = 0
                
            case 1:
                controller.SearchType = 1
                
                
            default:
                break;
            }

            
            controller.Origin = OriginCodeText.text!
            controller.Destination = DestinationCodeText.text!
            controller.flights1 = self.Flights1
            controller.flights2 = self.Flights2
           
            
        }
    }
 
}
