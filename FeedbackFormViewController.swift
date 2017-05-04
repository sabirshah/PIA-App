//
//  FeedbackFormViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/29/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class FeedbackFormViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var message: UITextView!

    @IBOutlet weak var SubmitButton: UIButton!
    
    var FeedbackID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //SubmitButton.backgroundColor = UIColor(hex6: 0x004f30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        message.resignFirstResponder()
        return false
    }
    
    @IBAction func send(_ sender: AnyObject) {
        
        FeedBack.Comments = message.text
        var feedbackGiven = false
        
        
        
        if message.text != "" {
            
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
                    
                    
                    self.performSegue(withIdentifier: "feedbackComplete3", sender: nil)
                    
                    // alert(self, title: "Message!", Description: "Feedback Sent")
                }else{
                    alert(self, title: "Error!", Description: error!)
                    
                }
                Loader.Stop()
            }
        }else{
            alert(self, title: "Message!", Description: "Please provide feedback first.")
        }
        
    }
    
    
}
