//
//  HomeViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var plane: UIImageView!
    
    @IBOutlet weak var version: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        let prefs:UserDefaults = UserDefaults.standard
//        prefs.set(false, forKey: "VERIFIED")
        var app_version = CheckVersionServices.getVerion()
       self.version.text = "v-\(app_version)"
        
        CheckVersionServices.isUpdated { (action, message, error) in
            
            if error == nil {
                
                if action == "ERROR" {
                    self.errorController(title: action!, message: message!)
                } else if action == "WARNING" {
                    self.warningController(title: action!, message: message!)
                }
                
            }else{
                let prefs:UserDefaults = UserDefaults.standard
                prefs.set(false, forKey: "VERIFIED")
                
            }
        }
    
    }

    @IBAction func skipAction(_ sender: AnyObject) {
        performSegue(withIdentifier: "Main", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.navigationController?.isNavigationBarHidden=true
        

    }
    
    @IBAction func SignUpAction(_ sender: AnyObject) {
        performSegue(withIdentifier: "Signup", sender: nil)
        
    }
    @IBAction func LoginAction(_ sender: AnyObject) {
          performSegue(withIdentifier: "Login", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
      //  signupButton.layer.cornerRadius = signupButton.frame.size.height/2
      //  signupButton.clipsToBounds=true;
        
        //LoginButton.layer.cornerRadius=LoginButton.frame.size.height/2
        //LoginButton.clipsToBounds=true;
        

    }
    
    @IBAction func information(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "awardplus", sender: nil)
    
    }
    
    @IBAction func infoButton(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "awardplus", sender: nil)

        
    }
    
    fileprivate func errorController(title:String,message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in   }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Update", style: .default) { (action) in
            UIApplication.shared.openURL(NSURL(string : "itms-apps://itunes.apple.com/app/id1143220222")! as URL)
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {        }
    }
    
    fileprivate func warningController(title:String,message:String){
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action) in   }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Update", style: .default) { (action) in
            UIApplication.shared.openURL(NSURL(string : "itms-apps://itunes.apple.com/app/id1143220222")! as URL)
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {        }
    }
}
