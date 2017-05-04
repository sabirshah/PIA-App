//
//  SignUpViewController.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/25/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var NameTitle: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var NIC: UITextField!
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var MobileNo: UITextField!
    @IBOutlet weak var EmailAddress: UITextField!
    @IBOutlet weak var HomeAddress: UITextField!
    @IBOutlet weak var Gender: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var Country: UITextField!

   
    @IBAction func SignUpUser(_ sender: AnyObject) {
        
        var AllFilled = false
        
        if( NameTitle.text == "")
        {
            alert(self, title: "Required", Description: "Title is required")
            
        }
        else if( FirstName.text == "")
        {
            alert(self, title: "Required", Description: "First Name is required")
            
        }
        else if( LastName.text == "")
        {
            alert(self, title: "Required", Description: "Last Name is required")
            
        }
        else if( NIC.text == "")
        {
            alert(self, title: "Required", Description: "NIC is required")
            
        }
        else if( DOB.text == "")
        {
            alert(self, title: "Required", Description: "Date Of Birth is required")
            
        }
        else if( MobileNo.text == "")
        {
            alert(self, title: "Required", Description: "Mobile Number is required")
            
        }
        else if( EmailAddress.text == "")
        {
            alert(self, title: "Required", Description: "Email Address is required")
            
        }
        else if( HomeAddress.text == "")
        {
            alert(self, title: "Required", Description: "Home Address is required")
            
        }
        else if( Gender.text == "")
        {
            alert(self, title: "Required", Description: "Gender is required")
            
        }
        else if( City.text == "")
        {
            alert(self, title: "Required", Description: "Gender is required")
            
        }
        else if( Country.text == "")
        {
            alert(self, title: "Required", Description: "Gender is required")
            
        }
        else
        {
            AllFilled = true
        }
        

        
        if AllFilled == true
        {
            
            self.NameTitle.resignFirstResponder()
            self.FirstName.resignFirstResponder()
            self.LastName.resignFirstResponder()
            self.NIC.resignFirstResponder()
            self.DOB.resignFirstResponder()
            self.MobileNo.resignFirstResponder()
            self.EmailAddress.resignFirstResponder()
            self.HomeAddress.resignFirstResponder()
            self.Gender.resignFirstResponder()
            self.City.resignFirstResponder()
            self.Country.resignFirstResponder()

            
            
            Loader.Start(self)
     
            SignUpUserService.SingUpNewUser(_title: self.NameTitle.text!,firstName: self.FirstName.text!, lastName: self.LastName.text!,nic: self.NIC.text!,dob: self.DOB.text!, mobileNo: self.MobileNo.text!, emailAddress: self.EmailAddress.text!,homeAddress: self.HomeAddress.text!, gender: Gender.text!, city: self.City.text!,country: self.Country.text!) { (signup, error) in
                
                
                if error == nil {
                    
                    alert(self, title: "Message", Description: "Registration Successful. Your account will be processed soon!")
                }
                else
                {
                    alert(self, title: "Error!", Description: error!.capitalized)
                }
                
                Loader.Stop()
                
                
            }
            
            
        }
        else
        {
            alert(self, title: "Error!", Description: "SignUp field(s) Can't be Blank!")
        }
    
    
        
    
    }

    @IBAction func tap(_ sender: AnyObject) {
        
        self.NameTitle.resignFirstResponder()
        self.FirstName.resignFirstResponder()
        self.LastName.resignFirstResponder()
        self.NIC.resignFirstResponder()
        self.DOB.resignFirstResponder()
        self.MobileNo.resignFirstResponder()
        self.EmailAddress.resignFirstResponder()
        self.HomeAddress.resignFirstResponder()
        self.Gender.resignFirstResponder()
        self.City.resignFirstResponder()
        self.Country.resignFirstResponder()
        

    
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    @IBOutlet weak var BlockView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        self.BlockView.layer.borderWidth = 2
////        self.BlockView.layer.borderColor  = UIColor.blue
//       self.BlockView.layer.cornerRadius = 10
//       self.BlockView.layer.masksToBounds = true
        
    }
    override func viewDidLayoutSubviews() {
      
   
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func infoButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "awardplus", sender: nil)
        
        
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
