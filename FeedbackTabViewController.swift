//
//  FeedbackTabViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/19/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//



import UIKit
import SwiftMoment


class FeedbackTabViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate , UITextFieldDelegate {
    
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet weak var backgroung: UIImageView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var veryGood: UIImageView!
    @IBOutlet weak var goog: UIImageView!
    @IBOutlet weak var average: UIImageView!
    @IBOutlet weak var poor: UIImageView!
    @IBOutlet weak var veryPoor: UIImageView!
    var feedback_id = 0
    var department_id = 0
    var index = 0
    var heading:String? = ""
    let picker = UIImagePickerController()
    var backImage:UIImage?
    var isFeedback=false
    @IBOutlet weak var message: UITextField!
    
    override func viewDidLoad() {
        
        // Set the current page
       // pageControl.currentPage = index
        
        
        if let title = self.title {
            
            if title == "TRANSIT SERVICES" || title == "  AIRPORT CHECK-IN"{
                self.backgroung.image = UIImage(named: "AIRPORT CHECK-IN")
                
            }else{
                self.backgroung.image = UIImage(named: title)
                
            }
            backImage = self.backgroung.image
            
        }
        
        
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        message.resignFirstResponder()
        return false
    }

    
    override func viewWillDisappear(_ animated: Bool) {
       
        var base64String = ""
        if (backImage != self.backgroung.image)
        {
            var data: Data = Data()
            
            if let image = self.backgroung.image {
                data = UIImageJPEGRepresentation(image,0.1)!
            }
            
            base64String = data.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        }

        //Adding FeedBack
        
        FeedBack.FeedBackDepartments[department_id] = FeedBackDepartment.init(CategoryID: department_id, FeedBackID: feedback_id, Comments: message.text, Photx64: base64String)
        
        
        
    }
    
    
    
    @IBAction func camera(_ sender: AnyObject) {
        
        picker.delegate = self
        picker.sourceType = .camera
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func SaveClick(_ sender: AnyObject) {
        
        //
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        self.backgroung.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func feedbackFaces(_ sender: UITapGestureRecognizer) {
        
        let imageview = sender.view as! UIImageView
        self.isFeedback = true
        switch imageview.tag {
            
        case 0:
            self.veryGood.image = UIImage(named: "very_good_selected-1")
            self.goog.image = UIImage(named: "good_unselected-1")
            self.average.image = UIImage(named: "average_unselected-1")
            self.poor.image = UIImage(named: "poor_unselected-1")
            self.veryPoor.image = UIImage(named: "very_poor_unselected-1")
            self.view.makeToast(message: "Very Good", duration: 1, position: "center" as AnyObject)
            feedback_id = 5
        case 1:
            self.veryGood.image = UIImage(named: "very_good_unselected-1")
            self.goog.image = UIImage(named: "good_selected-1")
            self.average.image = UIImage(named: "average_unselected-1")
            self.poor.image = UIImage(named: "poor_unselected-1")
            self.veryPoor.image = UIImage(named: "very_poor_unselected-1")
            self.view.makeToast(message: "Good", duration: 1, position: "center" as AnyObject)
            feedback_id = 4
            
        case 2:
            self.veryGood.image = UIImage(named: "very_good_unselected-1")
            self.goog.image = UIImage(named: "good_unselected-1")
            self.average.image = UIImage(named: "average_selected-1")
            self.poor.image = UIImage(named: "poor_unselected-1")
            self.veryPoor.image = UIImage(named: "very_poor_unselected-1")
            self.view.makeToast(message: "Average", duration: 1, position: "center" as AnyObject)
            feedback_id = 3
            
        case 3:
            self.veryGood.image = UIImage(named: "very_good_unselected-1")
            self.goog.image = UIImage(named: "good_unselected-1")
            self.average.image = UIImage(named: "average_unselected-1")
            self.poor.image = UIImage(named: "poor_selected-1")
            self.veryPoor.image = UIImage(named: "very_poor_unselected-1")
            self.view.makeToast(message: "Poor", duration: 1, position: "center" as AnyObject)
            feedback_id = 2
        default:
            self.veryGood.image = UIImage(named: "very_good_unselected-1")
            self.goog.image = UIImage(named: "good_unselected-1")
            self.average.image = UIImage(named: "average_unselected-1")
            self.poor.image = UIImage(named: "poor_unselected-1")
            self.veryPoor.image = UIImage(named: "very_poor_selected-1")
            self.view.makeToast(message: "Very Poor", duration: 1, position: "center" as AnyObject)
            feedback_id = 1
        }
    }
    
    @IBAction func send(_ sender: AnyObject) {
        
        
        
        //Adding FeedBack
        var base64String = ""
        if (backImage != self.backgroung.image)
        {
            var data: Data = Data()
            
            if let image = self.backgroung.image {
                data = UIImageJPEGRepresentation(image,0.1)!
            }
            
             base64String = data.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        }
        
        
        FeedBack.FeedBackDepartments[department_id] = FeedBackDepartment.init(CategoryID: department_id, FeedBackID: feedback_id, Comments: message.text, Photx64: base64String)
        

        
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
                    
                    
                    self.performSegue(withIdentifier: "feedbackComplete2", sender: nil)
                    
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
