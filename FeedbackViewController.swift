//
//  FeedbackViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/19/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SwiftMoment

class FeedbackViewController: UIViewController,CalendarDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    @IBOutlet weak var ContinueButton: UIButton!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var flightNo: UITextField!
    @IBOutlet weak var reservationCode: UITextField!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    let datePicker = UIDatePicker()
    
    @IBAction func openhome(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.characters.count + string.characters.count - range.length
        
        return newLength <= getMaxLength(textField) // Bool
    }
    
    func getMaxLength(_ textField : UITextField) -> Int {
        
        let type = textField.tag
        
        switch (type) {
        case 1 : return 4
        case 2: return 4
            
        default : return 40
            
        }
    }

    
        override func viewDidLoad() {
        super.viewDidLoad()
         ContinueButton.backgroundColor = UIColor(hex6: 0x004f30)
        self.date.text = moment().format("EEE dd MMM YYYY")
        self.configureDatePicker()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
            
            
            if let user = User.sharedInstance {
            
            
                self.Name.isEnabled = false
                self.Email.isEnabled = false
                self.Name.text = User.sharedInstance?.Name
                self.Email.text = User.sharedInstance?.Email_Address
                
            }
            else
            {
                self.Name.isEnabled = true
                self.Email.isEnabled = true
                self.Name.text = ""
                self.Email.text = ""
            }

            
            
            
            
            
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
            
            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false
            
            view.addGestureRecognizer(tap)        // Do any additional setup after loading the view.

            
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DateClick(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "DateSegue3", sender: nil)
    }
    @IBAction func `continue`(_ sender: AnyObject) {
        
        if flightNo.text == ""
        {
            alert(self, title: "Required", Description: "Please enter a valid flight number")
        }
        else
        {
        
        FeedBack.Title = ""
        FeedBack.FlightNo = flightNo.text
        FeedBack.FlightDT = moment().format("dd-MM-yyyy")
            var name = ""
            if(self.Name.text == "")
            {
                name = "Anonymous"
            }
            else
            {
                name = self.Name.text!
            }
        FeedBack.FirstName = name
            var email = ""
            if(self.Name.text == "")
            {
                email = "anonymous@piac.aero"
            }
            else
            {
                email = self.Email.text!
            }
        FeedBack.Email = email
        FeedBack.PhoneC = User.sharedInstance?.mobile_no
        FeedBack.PhoneH = User.sharedInstance?.home_no
        
        
        for i in 1...10
        {
        FeedBack.FeedBackDepartments[i] = FeedBackDepartment.init(CategoryID: i , FeedBackID: 0, Comments: "", Photx64: "")
        }
        
        
        self.performSegue(withIdentifier: "FeedbackSegue", sender: nil)
        }

    }
    
    @IBAction func selectDate(_ sender: AnyObject) {
    }
    
    func selectedDate(_ Date: String) {
        
        
        
    }
    func selectedDate(_ Date1: String, Date2: String) {
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DateSegue3" {
            let dest = segue.destination as! CalenderViewController
            dest.delegate = self
            dest.TripType = 1
            
            
            
            
            
            
        }
       
    }
    
    fileprivate func configureDatePicker(){
        
        
        //pickerview settings
        self.datePicker.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: UIApplication.shared.keyWindow!.frame.height / 3.191)
         self.datePicker.datePickerMode = UIDatePickerMode.date

        //toolbar for pickerview
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 30)
        let toolBar = UIToolbar(frame:frame)
        toolBar.isTranslucent = false
//        toolBar.tintColor = UIColor(red: 47, green: 124, blue: 21, alpha: 1)
        toolBar.sizeToFit()
        
        //toolbar buttons done or cancel
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.doneDate))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.cancelDate))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        self.date.inputView = datePicker
        self.date.inputAccessoryView = toolBar
        self.datePicker.backgroundColor = UIColor.white
        
    }
    
    func doneDate() {
        self.date.resignFirstResponder()
        self.date.text = moment(self.datePicker.date).format("EEE dd MMM YYYY")
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        date.resignFirstResponder()
        flightNo.resignFirstResponder()
        reservationCode.resignFirstResponder()
        return false
    }
    
    func cancelDate() {
        self.date.resignFirstResponder()
    }
    
    
}

