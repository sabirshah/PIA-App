//
//  ViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/14/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import GMStepper
import SwiftMoment



class ViewController: UIViewController,sectorSelectionDelegate,CalendarDelegate, UITableViewDelegate, UITableViewDataSource {

    // TODO:ABC Job
    

    @IBOutlet weak var Template2: UIView!
    @IBOutlet weak var Template1: UIView!
    @IBOutlet weak var ClassSegment: UISegmentedControl!
    @IBOutlet weak var OriginText: UILabel!
    @IBOutlet weak var AdultStepper: GMStepper!
    @IBOutlet weak var InfantStepper: GMStepper!
    @IBOutlet weak var menubutton: UIBarButtonItem!
    @IBOutlet weak var ChildStepper: GMStepper!
    @IBOutlet weak var DestinationText: UILabel!
    @IBOutlet weak var OriginCodeText: UILabel!
    @IBOutlet weak var DestinationCodeText: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var DateText: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var MultiSearchButton: UIButton!
    @IBOutlet weak var MultiCityTable: UITableView!
    @IBOutlet weak var MultiAdultStepper: GMStepper!
    
    @IBOutlet weak var MultiInfantStepper: GMStepper!
    @IBOutlet weak var MultiChildStepper: GMStepper!
    var DepartureDate : String?
    var ArrivalDate : String?
    var onlyDep:String?
    var MutlyCityDictionary = [Int:Departure]()
    var CurrentCell:MultiCityTableViewCell?
    
    @IBOutlet weak var SearchButton: UIButton!
    var TapButton : String?
    var TapDate : String?
    var rowCountSectionOne : Int?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        

        
        }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return MutlyCityDictionary.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
 
       var cell = tableView.dequeueReusableCell(withIdentifier: "MultiCityCell") as! MultiCityTableViewCell
        
        
        let tapGesture1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.AddButtonClick(_:)))
        tapGesture1.numberOfTapsRequired = 1
        cell.AddButton.isUserInteractionEnabled =  true
        cell.AddButton.addGestureRecognizer(tapGesture1)
        
        
        let tapGesture2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.AddButtonClick(_:)))
        tapGesture2.numberOfTapsRequired = 1
        cell.AddButtonText.isUserInteractionEnabled =  true
        cell.AddButtonText.addGestureRecognizer(tapGesture2)

        let tapGesture3: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DeleteButtonClick(_:)))
        tapGesture3.numberOfTapsRequired = 1
        cell.DeleteButton.isUserInteractionEnabled =  true
        cell.DeleteButton.addGestureRecognizer(tapGesture3)
        
        
        let tapGesture4: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DeleteButtonClick(_:)))
        tapGesture4.numberOfTapsRequired = 1
        cell.DeleteButtonText.isUserInteractionEnabled =  true
        cell.DeleteButtonText.addGestureRecognizer(tapGesture4)
        
        
        //For first cell -> Add View Visible, Delete View Not Visible
        if( indexPath.row == 0 &&  MutlyCityDictionary.count == 1)
        {
            cell.DeleteView.isHidden = true
            cell.AddView.isHidden = false
        }
        else if indexPath.row == 0
        {
            cell.DeleteView.isHidden = true
            cell.AddView.isHidden = true
        }
        else if indexPath.row == 5 // Last Row and limit is reached
        {
            //not allowed to add more.
            cell.DeleteView.isHidden = false
            cell.AddView.isHidden = true
        }
        else if indexPath.row == MutlyCityDictionary.count - 1 // Last Row but limit is not reached
        {
            cell.DeleteView.isHidden = false
            cell.AddView.isHidden = false
            
        }
        else
        
        {
            cell.DeleteView.isHidden = true
            cell.AddView.isHidden = true
        }
           //  MutlyCityDictionary[0] = Departure(OriginCode: "KHI",OriginText: "KARACHI",DestinationCode: "ISB",DestinationText: "ISLAMABAD",DepartureDate: moment().format("MMMM d, yyyy"))
        
        cell.Origin.setTitle(MutlyCityDictionary[indexPath.row]?.OriginCode, for: .normal)
        cell.OriginText.setTitle(MutlyCityDictionary[indexPath.row]?.OriginText, for: .normal)

        cell.Destination.setTitle(MutlyCityDictionary[indexPath.row]?.DestinationCode, for: .normal)

        cell.DestinationText.setTitle(MutlyCityDictionary[indexPath.row]?.DestinationText, for: .normal)

        cell.DepartureDate.setTitle(MutlyCityDictionary[indexPath.row]?.DepartureDate, for: .normal)
        //For middle one ->Add View Visible, Delete View Visible
        //For Limit (6) cell -> Add View Not Visible, Delete View  Visible
        
        
        
        return cell
    }
    
    
    @IBAction func DeleteButtonClick(_ sender: UITapGestureRecognizer) {
        
        if MutlyCityDictionary.count != 1
        {
            
            let previousCell = MultiCityTable.cellForRow(at: IndexPath(row: MutlyCityDictionary.count-1,section: 0)) as!MultiCityTableViewCell

            
            
            // Set Delete View to Visible = true
            MutlyCityDictionary[MutlyCityDictionary.count-1] = nil
            MultiCityTable.reloadData()
            
            scrollToBottom()
        }
    }

    
    
    
    
    @IBAction func AddButtonClick(_ sender: UITapGestureRecognizer) {
      
      if MutlyCityDictionary.count < 7
      {
        // Set Delete View to Visible = true
        let previousCell = MultiCityTable.cellForRow(at: IndexPath(row: MutlyCityDictionary.count-1,section: 0)) as!MultiCityTableViewCell
        
        previousCell.DeleteView.isHidden = false
        previousCell.AddView.isHidden = true

        
        MutlyCityDictionary[MutlyCityDictionary.count] = Departure(OriginCode: "KHI",OriginText: "KARACHI",DestinationCode: "ISB",DestinationText: "ISLAMABAD",DepartureDate: moment().format("MMMM d, yyyy"))

        MultiCityTable.reloadData()
      
        scrollToBottom()
        }
    }
    
    func scrollToBottom() {
        let index = IndexPath(row: MutlyCityDictionary.count-1 , section: 0)
        self.MultiCityTable.scrollToRow(at: index, at: .top, animated: true)
    }
    
    @IBAction func MultiOriginClick(_ sender: Any) {
        MultiCityOriginClick(sender: sender as! UIButton)
    }
    
    @IBAction func MultiOriginTextClick(_ sender: Any) {
        MultiCityOriginClick(sender: sender as! UIButton)

    }
    
    @IBAction func MultiDestinationClick(_ sender: Any) {
        MultiCityDestinationClick(sender: sender as! UIButton)

    }
    @IBAction func MultiDestinationTextClick(_ sender: Any) {
        MultiCityDestinationClick(sender: sender as! UIButton)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Adding first value to the MutlyCityDictionary i.e. KHI and ISB
 
        MutlyCityDictionary[0] = Departure(OriginCode: "KHI",OriginText: "KARACHI",DestinationCode: "ISB",DestinationText: "ISLAMABAD",DepartureDate: moment().format("MMMM d, yyyy"))
       

        for subview in (segmentedControl.subviews) {
            (subview as UIView).tintColor = UIColor(hex6: 0x004f30)
        }
        for subview in (ClassSegment.subviews) {
            (subview as UIView).tintColor = UIColor(hex6: 0x004f30)
        }
      //  OriginCodeText.textColor = UIColor(hex6: 0x004f30)
        OriginCodeText.textColor = UIColor(hex6: 0x004f30)
        OriginText.textColor = UIColor(hex6: 0x004f30)
        DestinationCodeText.textColor = UIColor(hex6: 0x004f30)
        DestinationText.textColor = UIColor(hex6: 0x004f30)
        DateText.textColor = UIColor(hex6: 0x004f30)
        AdultStepper.buttonsBackgroundColor = UIColor(hex6: 0x004f30)
        AdultStepper.labelBackgroundColor = UIColor(hex6: 0xbfa218)
        AdultStepper.labelFont = UIFont(name: "AvenirNext-Bold", size: 18.0)!
        ChildStepper.buttonsBackgroundColor = UIColor(hex6: 0x004f30)
        ChildStepper.labelBackgroundColor = UIColor(hex6: 0xbfa218)
        ChildStepper.labelFont = UIFont(name: "AvenirNext-Bold", size: 18.0)!
        InfantStepper.buttonsBackgroundColor = UIColor(hex6: 0x004f30)
        InfantStepper.labelBackgroundColor = UIColor(hex6: 0xbfa218)
        InfantStepper.labelFont = UIFont(name: "AvenirNext-Bold", size: 18.0)!

      
        
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
        
        
        let attr = NSDictionary(object: UIFont(name: "HelveticaNeue", size: 11.0)!, forKey: NSFontAttributeName as NSCopying)
        ClassSegment.setTitleTextAttributes(attr as! [AnyHashable: Any] , for: UIControlState())

        
        let tapGesture5: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DateClick(_:)))
        tapGesture5.numberOfTapsRequired = 1
        self.DateText.isUserInteractionEnabled =  true
        self.DateText.addGestureRecognizer(tapGesture5)
        
//        Loader.Start(self)
//        SectorService.getSectorsAsync(){ (origin, error) in
//            if error == nil {

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

                
                
                
//            }else{
//                alert(self, title: "Error!", Description: error!)
//            }
//            Loader.Stop()
            
       // }
   
    }
    @IBAction func HomeClick(_ sender: AnyObject) {
        
      let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
      let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        
    }
    
    
    
    
    
    @IBAction func SearchClick(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "SabreSegue", sender: nil)
     }
    
    @IBAction func MutliSearchClick(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "SabreSegue", sender: sender)
        
        
        
    }
    

    
  
    
    
    @IBAction func IndexChanged(_ sender: UISegmentedControl) {
        

        if sender.selectedSegmentIndex == 0  ||  sender.selectedSegmentIndex == 1 {
            DateText.text = self.onlyDep!
            Template1.isHidden = false
            Template2.isHidden = true
            
            if( sender.selectedSegmentIndex == 1)
            {
                DateText.text = "\(self.DepartureDate!) - \(self.ArrivalDate!)"

            }
            
        }
        else if sender.selectedSegmentIndex == 2 {
         Template1.isHidden = true
         Template2.isHidden = false
        }
        
       
    }

    @IBAction func AdultStepperChanged(_ sender: GMStepper) {
        if( (sender.value + ChildStepper.value) <= 6)
        {
            // Set infant value to 0
            
            
            if (sender.value <= 3) // Because not more than 3 infants are allowed
            {
                InfantStepper.value = 0 // any time changes occurs to max value of infant , change infant to 0
                InfantStepper.maximumValue = sender.value // Because infant must not be greater than adult.
            }
            else
            {
                //do nothing
            }
        }
        else
        {
            //Revert back the value of adult
            
            sender.value = sender.value - 1
            
        }
        
        
    }
    @IBAction func ChildStepperChanged(_ sender: GMStepper) {
        
        if( (sender.value + AdultStepper.value) <= 6)
        {
            
            //do nothing
            
        }
        else
        {
            //Revert back the value of adult
            
            sender.value = sender.value - 1
            
        }
        
    }
    
    @IBAction func MultiAdultStepperChanged(_ sender: GMStepper) {
        if( (sender.value + MultiChildStepper.value) <= 6)
        {
            // Set infant value to 0
            
            
            if (sender.value <= 3) // Because not more than 3 infants are allowed
            {
                MultiInfantStepper.value = 0 // any time changes occurs to max value of infant , change infant to 0
                MultiInfantStepper.maximumValue = sender.value // Because infant must not be greater than adult.
            }
            else
            {
                //do nothing
            }
        }
        else
        {
            //Revert back the value of adult
            
            sender.value = sender.value - 1
            
        }
        
        
    }
    @IBAction func MultiChildStepperChanged(_ sender: GMStepper) {
        
        if( (sender.value + MultiAdultStepper.value) <= 6)
        {
            
            //do nothing
            
        }
        else
        {
            //Revert back the value of adult
            
            sender.value = sender.value - 1
            
        }
        
    }

    
    func selectedDate(_ Date: String) {
        
        print(Date)
      if(segmentedControl.selectedSegmentIndex == 2)
      {
        let a:Departure = MutlyCityDictionary[((MultiCityTable.indexPath(for: CurrentCell!))?.row)!]!
        a.DepartureDate = Date
        MutlyCityDictionary[(MultiCityTable.indexPath(for: CurrentCell!)?.row)!] = a
        CurrentCell?.MultiDate.setTitle(Date, for: .normal)
      }
        else  if(segmentedControl.selectedSegmentIndex == 0)
      {
        self.onlyDep = Date
        DateText.text = self.onlyDep
        self.DepartureDate = self.onlyDep
       }
        else
        {
            self.onlyDep = Date
            DateText.text = self.onlyDep
        }
    }
    
    func selectedDate(_ Date1: String, Date2: String) {
        
        self.ArrivalDate = Date2
        self.DepartureDate = Date1
        DateText.text = "\(self.DepartureDate!) - \(self.ArrivalDate!)"
        
    }
    func selectedOrigin(_ origin : Origin) {
        print("\(origin.Code)  \(origin.Name)")
        
          if(segmentedControl.selectedSegmentIndex == 2)
          {
            //MultiCity 
            //Set the value inside CurrentCell
            
            
            
            CurrentCell?.Origin.setTitle(origin.Code?
                .characters.split{$0 == "("}.map(String.init)[0], for: .normal)
            CurrentCell?.OriginText.setTitle(origin.Name?
                .characters.split{$0 == "("}.map(String.init)[0], for: .normal)
           
            let a:Departure = MutlyCityDictionary[((MultiCityTable.indexPath(for: CurrentCell!))?.row)!]!
            a.OriginCode = origin.Code?
                .characters.split{$0 == "("}.map(String.init)[0]
            a.OriginText = origin.Name?
                .characters.split{$0 == "("}.map(String.init)[0]
            
            MutlyCityDictionary[(MultiCityTable.indexPath(for: CurrentCell!)?.row)!] = a
          }
          else
          {
            self.OriginText.text = origin.Name?
                .characters.split{$0 == "("}.map(String.init)[0]
            self.OriginCodeText.text = origin.Code
            self.DestinationText.text = "Destination"
            self.DestinationCodeText.text = ""

          }
    }
    
    
    func selectedDestination(_ destination : Destination) {
        if(segmentedControl.selectedSegmentIndex == 2)
        {
            //MultiCity
            //Set the value inside CurrentCell
            CurrentCell?.Destination.setTitle(destination.Code?
                .characters.split{$0 == "("}.map(String.init)[0], for: .normal)
            CurrentCell?.DestinationText.setTitle(destination.Name?
                .characters.split{$0 == "("}.map(String.init)[0], for: .normal)
            
            let a:Departure = MutlyCityDictionary[((MultiCityTable.indexPath(for: CurrentCell!))?.row)!]!
            a.DestinationCode = destination.Code?
                .characters.split{$0 == "("}.map(String.init)[0]
            a.DestinationText = destination.Name?
                .characters.split{$0 == "("}.map(String.init)[0]
            
            MutlyCityDictionary[(MultiCityTable.indexPath(for: CurrentCell!)?.row)!] = a


        }
        else
        {
        print("\(destination.Code)  \(destination.Name)")
        self.DestinationText.text = destination.Name?
            .characters.split{$0 == "("}.map(String.init)[0]
        self.DestinationCodeText.text = destination.Code
        }
            
        
    }
    @IBAction func MultiDateClick(_ sender: UIButton) {
        CurrentCell =   sender.superview?.superview?.superview as? MultiCityTableViewCell

       var a =  MultiCityTable.indexPath(for: CurrentCell!)
        print(a)
        self.performSegue(withIdentifier: "DateSegue", sender: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func MultiCityOriginClick(sender : UIButton) {
        
        //finding the cell index
    
     CurrentCell =   sender.superview?.superview?.superview?.superview as? MultiCityTableViewCell

        
        TapButton = "Origin";
        self.performSegue(withIdentifier: "SectorsSegue", sender: nil)
        
    }
    func MultiCityDestinationClick(sender : UIButton) {
        CurrentCell =   sender.superview?.superview?.superview?.superview as? MultiCityTableViewCell

        TapButton = "Destination";
        self.performSegue(withIdentifier: "SectorsSegue", sender: nil)
        
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
 
    
    
    //MultiCity PricingTableViewController
    
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FlightSearchSegue"{
            
            
            let dest = segue.destination as! PricingTableViewController
            
            dest.rowCountSectionOne =  self.rowCountSectionOne
            if(ClassSegment.selectedSegmentIndex==0)
            {
                dest.bookingClass = 0
            }
            else  if(ClassSegment.selectedSegmentIndex==1)
            {
                dest.bookingClass = 1
            }
            else  if(ClassSegment.selectedSegmentIndex==2)
            {
                dest.bookingClass = 2
            }
            if(segmentedControl.selectedSegmentIndex == 0)
            {
                dest.sectionCount = 1
                dest.Origin1 = OriginCodeText.text
                dest.Destination1 = DestinationCodeText.text
                
                dest.Origin2 = nil
                dest.Destination2 = nil
            }
            else
            {
                
                dest.sectionCount = 2
                dest.Origin1 = OriginCodeText.text
                dest.Destination1 = DestinationCodeText.text
                
                dest.Origin2 = DestinationCodeText.text
                dest.Destination2 = OriginCodeText.text
                
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
                    case 2:
                        
                        dest.TripType = 1
                        dest.DepartDate = self.onlyDep
                    default:
                        break;
                    }
                    
        }
        
            else if segue.identifier == "SabreSegue" {
                
            let controller = segue.destination as! SabreViewController

            if( segmentedControl.selectedSegmentIndex == 2)
            {
               //Multi Search Clicked
                
                if MutlyCityDictionary.count >= 1
                {
                controller.origin = (MutlyCityDictionary[0]?.OriginCode)!
                controller.destination = (MutlyCityDictionary[0]?.DestinationCode)!
                controller.departureDate = moment((MutlyCityDictionary[0]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }
                if MutlyCityDictionary.count >= 2
                {
                    controller.origin2 = (MutlyCityDictionary[1]?.OriginCode)!
                    controller.destination2 = (MutlyCityDictionary[1]?.DestinationCode)!
                    controller.departureDate2 = moment((MutlyCityDictionary[1]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }
                if MutlyCityDictionary.count >= 3
                {
                    controller.origin3 = (MutlyCityDictionary[2]?.OriginCode)!
                    controller.destination3 = (MutlyCityDictionary[2]?.DestinationCode)!
                    controller.departureDate3 = moment((MutlyCityDictionary[2]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }
                if MutlyCityDictionary.count >= 4
                {
                    controller.origin4 = (MutlyCityDictionary[3]?.OriginCode)!
                    controller.destination4 = (MutlyCityDictionary[3]?.DestinationCode)!
                    controller.departureDate4 = moment((MutlyCityDictionary[3]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }
                if MutlyCityDictionary.count >= 5
                {
                    controller.origin5 = (MutlyCityDictionary[4]?.OriginCode)!
                    controller.destination5 = (MutlyCityDictionary[4]?.DestinationCode)!
                    controller.departureDate5 = moment((MutlyCityDictionary[4]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }
                if MutlyCityDictionary.count >= 6
                {
                    controller.origin6 = (MutlyCityDictionary[5]?.OriginCode)!
                    controller.destination6 = (MutlyCityDictionary[5]?.DestinationCode)!
                    controller.departureDate6 = moment((MutlyCityDictionary[5]?.DepartureDate!)!)!.format("yyyy-MM-dd")
                }

               //controller.isMultiCity = true
                controller.journeySpan = "MC"
                controller.numAdults = String(Int( MultiAdultStepper.value))
                controller.numChildren = String(Int(MultiChildStepper.value))
                controller.numInfants = String(Int(MultiInfantStepper.value))
                
             } else if( segmentedControl.selectedSegmentIndex == 1) {
                    controller.origin = OriginCodeText.text!
                    controller.destination = DestinationCodeText.text!
                    
                    controller.departureDate = moment(DepartureDate!)!.format("yyyy-MM-dd")
                    controller.returnDate = moment(self.ArrivalDate!)!.format("yyyy-MM-dd")
                    controller.numAdults = String(Int( AdultStepper.value))
                    controller.numChildren = String(Int(ChildStepper.value))
                    controller.numInfants = String(Int(InfantStepper.value))
//                    controller.isMultiCity = false
                    controller.journeySpan = "RT"
                    controller.origin2 = ""
                }
                else
             {
                
                controller.origin = OriginCodeText.text!
                controller.destination = DestinationCodeText.text!
                
                controller.departureDate = moment(DepartureDate!)!.format("yyyy-MM-dd")
                controller.returnDate = moment(self.ArrivalDate!)!.format("yyyy-MM-dd")
                controller.numAdults = String(Int( AdultStepper.value))
                controller.numChildren = String(Int(ChildStepper.value))
                controller.numInfants = String(Int(InfantStepper.value))
//                controller.isMultiCity = false
                controller.journeySpan = "OW"
                controller.origin2 = ""
                }
              
                
        }
        
    }

}

