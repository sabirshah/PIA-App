//
//  DashboardViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 9/6/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var View11: UIView!
    @IBOutlet weak var View12: UIView!
    @IBOutlet weak var View13: UIView!
    @IBOutlet weak var View21: UIView!
    @IBOutlet weak var View22: UIView!
    @IBOutlet weak var View23: UIView!
    @IBOutlet weak var View31: UIView!
    @IBOutlet weak var View32: UIView!
    @IBOutlet weak var View33: UIView!
    @IBOutlet weak var menubutton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
      
        
        
        
        
        if revealViewController() != nil {
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }

        //Background UIColor
        
        View11.backgroundColor =  UIColor(hex6: 0x004f30)
        View12.backgroundColor =  UIColor(hex6: 0x004f30)
        View13.backgroundColor =  UIColor(hex6: 0x004f30)
        View21.backgroundColor =  UIColor(hex6: 0x004f30)
        View22.backgroundColor =  UIColor(hex6: 0x004f30)
        View23.backgroundColor =  UIColor(hex6: 0x004f30)
        View31.backgroundColor =  UIColor(hex6: 0x004f30)
        View32.backgroundColor =  UIColor(hex6: 0x004f30)
        View33.backgroundColor =  UIColor(hex6: 0x004f30)
        
        
        View11.tag =  0
        View12.tag =  1
        View13.tag =  2
        View21.tag =  3
        View22.tag =  4
        View23.tag =  5
        View31.tag =  6
        View32.tag =  7
        View33.tag =  8

        //Rounded Corners
        View11.layer.cornerRadius = 6
        View12.layer.cornerRadius = View11.layer.cornerRadius
         View12.layer.cornerRadius = View11.layer.cornerRadius
         View12.layer.cornerRadius = View11.layer.cornerRadius
         View13.layer.cornerRadius = View11.layer.cornerRadius
         View21.layer.cornerRadius = View11.layer.cornerRadius
         View12.layer.cornerRadius = View11.layer.cornerRadius
         View22.layer.cornerRadius = View11.layer.cornerRadius
         View23.layer.cornerRadius = View11.layer.cornerRadius
        View31.layer.cornerRadius = View11.layer.cornerRadius
        View32.layer.cornerRadius = View11.layer.cornerRadius
        View33.layer.cornerRadius = View11.layer.cornerRadius
        View11.layer.masksToBounds = true
        View12.layer.masksToBounds = true
        View13.layer.masksToBounds = true
        View21.layer.masksToBounds = true
        View22.layer.masksToBounds = true
        View23.layer.masksToBounds = true
        View31.layer.masksToBounds = true
        View32.layer.masksToBounds = true
        View33.layer.masksToBounds = true
        
        
        //Tapping on Views
        let tapGesture11: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View11Click(_:)))
        tapGesture11.numberOfTapsRequired = 1
        self.View11.isUserInteractionEnabled =  true
        self.View11.addGestureRecognizer(tapGesture11)
        
        let tapGesture12: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View12Click(_:)))
        tapGesture12.numberOfTapsRequired = 1
        self.View12.isUserInteractionEnabled =  true
        self.View12.addGestureRecognizer(tapGesture12)

        let tapGesture13: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View13Click(_:)))
        tapGesture13.numberOfTapsRequired = 1
        self.View13.isUserInteractionEnabled =  true
        self.View13.addGestureRecognizer(tapGesture13)

        let tapGesture21: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View21Click(_:)))
        tapGesture21.numberOfTapsRequired = 1
        self.View21.isUserInteractionEnabled =  true
        self.View21.addGestureRecognizer(tapGesture21)

        let tapGesture22: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View22Click(_:)))
        tapGesture22.numberOfTapsRequired = 1
        self.View22.isUserInteractionEnabled =  true
        self.View22.addGestureRecognizer(tapGesture22)

        let tapGesture23: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View23Click(_:)))
        tapGesture23.numberOfTapsRequired = 1
        self.View23.isUserInteractionEnabled =  true
        self.View23.addGestureRecognizer(tapGesture23)

        let tapGesture31: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View31Click(_:)))
        tapGesture31.numberOfTapsRequired = 1
        self.View31.isUserInteractionEnabled =  true
        self.View31.addGestureRecognizer(tapGesture31)

        let tapGesture32: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View32Click(_:)))
        tapGesture32.numberOfTapsRequired = 1
        self.View32.isUserInteractionEnabled =  true
        self.View32.addGestureRecognizer(tapGesture32)

        let tapGesture33: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DashboardViewController.View33Click(_:)))
        tapGesture33.numberOfTapsRequired = 1
        self.View33.isUserInteractionEnabled =  true
        self.View33.addGestureRecognizer(tapGesture33)

        
        
        
        //BackGround Image
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "app_back-1.png")!.draw(in: self.view.bounds)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func View11Click(_ recognizer: UITapGestureRecognizer) {
        
  performSegue(withIdentifier: "FlightPricingSegue", sender: nil)
        
        
    }
    func View12Click(_ recognizer: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "FlightStatusSegue", sender: self.View12)
    
    }
    func View13Click(_ recognizer: UITapGestureRecognizer) {
        
        let prefs:UserDefaults = UserDefaults.standard
        
        let verified = prefs.bool(forKey: "VERIFIED")
        if verified == true {
            performSegue(withIdentifier: "userProfile", sender: nil)
        }
        else
        {
            // go to home screen
            

            performSegue(withIdentifier: "HomeSegue", sender: nil)
  
            alert(self, title: "Authentication Fail", Description: "Please Sign In to use the Award Plus feature!")
            
        }
    }
    func View21Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "DScheduleSegue", sender: self.View21)
    }
    func View22Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "viewPnr", sender: nil)
    }
    func View23Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "info", sender: nil)
    }
    func View31Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "feedback", sender: nil)
    }
    func View32Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "trips", sender: nil)
    }
    func View33Click(_ recognizer: UITapGestureRecognizer) {
        performSegue(withIdentifier: "contactus", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DScheduleSegue")
        {
            let controller = segue.destination as? ScheduleViewController
            print((sender as! UIView).tag)
            if((sender as! UIView).tag == 1)
            {
                controller?.SearchBy = 1
            }
        }
    }

}
