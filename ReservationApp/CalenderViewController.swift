//
//  CalenderViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import FSCalendar
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

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


class CalenderViewController: UIViewController,UITextFieldDelegate   {
   
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var DatesStackView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var DepartureDate: UITextField!
    @IBOutlet weak var ArrivalDate: UITextField!
    @IBOutlet var MainView: UIView!
    var animationFinished = true
    var delegate:CalendarDelegate?
    var DepartDate : String?
    var DatePointer : Int?
    var TripType : Int?
    fileprivate var TopOneWayConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var departureButton: Custombutton!
    @IBOutlet weak var arrivalButton: Custombutton!
    var buttonSelection = true
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBAction func DepartTouchDown(_ sender: UITextField) {
        
        DatePointer = 1
    }
    
    
    @IBAction func ArrTouchDown(_ sender: AnyObject) {
        DatePointer = 2
    }
    
    @IBAction func DoneButton(_ sender: AnyObject) {
        
        if TripType == 2
        {
            if let date = self.arrivalButton.titleLabel!.text {
                self.delegate?.selectedDate( self.departureButton.titleLabel!.text!,Date2: date)
  
            }
            
        }
        else{
          
            self.delegate?.selectedDate( self.DepartDate!)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DepartDate = moment().format("MMMM d, yyyy")
        calendar.scrollDirection = .horizontal
        calendar.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
        calendar.select(calendar.date(withYear: 2015, month: 10, day: 10))
        
        TopOneWayConstraint = NSLayoutConstraint(item: self.calendar, attribute: .top, relatedBy: .equal, toItem: self.DatesStackView , attribute: .top, multiplier: 1.0, constant: 0)

        
        if TripType == 1
        {
            TopOneWayConstraint.isActive=true
            
        }
        else if TripType == 2
        {
            TopOneWayConstraint.isActive=false
            departureButton.setTitle(self.DepartDate!, for: UIControlState())
//            arrivalButton.setTitle( "\(moment().add(1.days).format("MMMM d, yyyy"))", forState: .Normal)
            departureButton.setTitleColor(UIColor(red: 47/255, green: 124/255, blue: 21/255, alpha: 1), for: UIControlState())
        }
        
        
    }

    @IBAction func departure(_ sender: AnyObject) {
        
        self.buttonSelection=true
        departureButton.setTitleColor(UIColor(red: 47/255, green: 124/255, blue: 21/255, alpha: 1), for: UIControlState())
        arrivalButton.setTitleColor(UIColor.black, for: UIControlState())
      
        
        
    }
    @IBAction func arrival(_ sender: AnyObject) {
        
        self.buttonSelection=false
        arrivalButton.setTitleColor(UIColor(red: 47/255, green: 124/255, blue: 21/255, alpha: 1), for: UIControlState())
        departureButton.setTitleColor(UIColor.black, for: UIControlState())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

   
  

}


extension CalenderViewController:FSCalendarDelegate,FSCalendarDataSource{
    
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        
        let oneYear = moment().add(1.years)
        return calendar.date(withYear: oneYear.year, month: oneYear.month, day: oneYear.day)
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        NSLog("change page to \(calendar.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        NSLog("calendar did select date \(calendar.string(from: date))")
       
        let selectedDate = moment(date).format("MMMM d, yyyy")

        if TripType == 2 {
            
            if buttonSelection {
                
                if let d = self.arrivalButton.titleLabel?.text {
                    if moment(date) <= moment(d)  {
                        
                        self.departureButton.setTitle("\(selectedDate)", for: UIControlState())
                        
                    }else{
                        
                        alert(self, title: "Messages", Description: "Wrong Date!")
                        
                    }
                }else{
                    self.departureButton.setTitle("\(selectedDate)", for: UIControlState())

                }
                
                
                
            }else{
                
                if moment(date) >= moment(self.departureButton.titleLabel!.text!){
                    
                    self.arrivalButton.setTitle("\(selectedDate)", for: UIControlState())
                    
                }else{
                    
                    alert(self, title: "Messages", Description: "Wrong Date!")
                }
                
//                self.arrivalButton.setTitle("\(selectedDate)", forState: .Normal)
                
            }
            

        }else{
            
            self.DepartDate = selectedDate
        }
        
    }
    
}
