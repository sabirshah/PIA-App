//
//  UserProfileViewController.swift
//  ReservationApp
//
//  Created by Admin on 13/08/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
//import RealmSwift
import SwiftMoment
class UserProfileViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
   
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var updates: UILabel!
    @IBOutlet weak var MobileNumber: UILabel!
    @IBOutlet weak var Address1: UILabel!
    @IBOutlet weak var Address2: UILabel!
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var City: UILabel!
    
    
    @IBOutlet weak var containerView: UIView!
       @IBOutlet weak var message: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
        
        
        
        if let user = User.sharedInstance {
            
            self.message.isHidden=true
          containerView.isHidden=false
            
            Loader.Start(self)
            LoginService.getPoints(user.TOKENID!, completion: { (points, error) in
                
                
                if error == nil {
                    

                  
                    self.name.text = points!.Name!
                    self.email.text = points!.Email_Address!
                    self.points.text = points!.balancePoints! //+ " (updated:" + moment(points!.date!).fromNow() + ")"
                   // self.updates.text = moment(points!.date!).fromNow()
                    self.MobileNumber.text = points!.mobile_no
                    
                   // var EndIndex = points!.Address?.characters.count
                  
                    //self.Address1.text = points?.Address
                    //  self.Address1.text = points!.Address?.substringWithRange(Range<String.Index>(start: (points!.Address?.startIndex)!, end: (points!.Address?.endIndex.advancedBy(-(EndIndex!/2)))!))
                    
                   
                   // self.Address2.text = points!.Address?.substringWithRange(Range<String.Index>(start: (points!.Address?.startIndex.advancedBy((EndIndex!/2)))!, end: (points!.Address?.endIndex)!))
                    
                    
                 //  self.DOB.text =  moment((points?.BirthDate)!, dateFormat: "yyyy-MM-dd", timeZone: TimeZone.current, locale: Locale.current)!.format("dd-MM-yyyy")
              
                  // self.City.text = points?.City
                    
                    
                }else{
                    
                    
                    if error == "The Internet connection appears to be offline." {
                        


                    }else{
                        
                        alert(self, title: "Error!", Description: error!)

                    }
                    
                }
                Loader.Stop()
                
            })
            
  

            
        }else{
            
            self.message.isHidden=false
            containerView.isHidden=true
  
            
        }
        
        
        
        
    }

    @IBAction func openHome(_ sender: AnyObject) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
