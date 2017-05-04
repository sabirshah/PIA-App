//
//  LoginViewController.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/22/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//
//40644
import UIKit
import RealmSwift
//Green: 004f30 , // gold: bfa218
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var EmailAddress: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var backgoundImage: UIImageView!
    @IBOutlet weak var LogonButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let tapGesture1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        tapGesture1.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled =  true
        self.view.addGestureRecognizer(tapGesture1)
        
        LogonButton.backgroundColor = UIColor(hex6: 0x004f30)
        
    }
    func tap(_ recognizer: UITapGestureRecognizer) {
        self.EmailAddress.resignFirstResponder()
        self.Password.resignFirstResponder()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=false
        
        
        //        let realm = try! Realm()
        //        let users = realm.objects(User.self)
        //
        //        if users.count != 0 {
        //
        //            self.EmailAddress.text = users[0].userID!
        //
        //        }
        //OMVPUI
        //NVQUFP
        //        let userdefault = UserDefaults.standard
        //        userdefault.set(User.self, forkey:  "User")
        //
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.characters.count + string.characters.count - range.length
        
        return newLength <= getMaxLength(textField) // Bool
    }
    
    func getMaxLength(_ textField : UITextField) -> Int {
        
        let type = textField.tag
        
        switch (type) {
        case 1 : return 9
        case 2: return 6
            
        default : return 1
            
        }
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden=true
        
    }
    
    @IBAction func Login(_ sender: AnyObject) {
        
        
        if EmailAddress.text != "" && Password.text != "" {
            
            Loader.Start(self)
            LoginService.getLogin(EmailAddress.text!, password: Password.text!)
            {(user, error) in
                
                if error == nil {
                    
                   
                        let prefs:UserDefaults = UserDefaults.standard
                        prefs.set(true, forKey: "VERIFIED")
                        prefs.set( user?.Name , forKey: "USERNAME")
                        prefs.set(user?.Email_Address, forKey: "EMAIL")
                        prefs.set(user?.userID, forKey: "MEMBERID")
                        prefs.synchronize()
                    

                    
                    
                    
                    self.performSegue(withIdentifier: "SuccessLogin", sender: nil)
                    
                }
                else
                {
                    let prefs:UserDefaults = UserDefaults.standard
                    prefs.set(false, forKey: "VERIFIED")
                    if error! == "The Internet connection appears to be offline." {
                        
                        //                        let realm = try! Realm()
                        //                        let users = realm.objects(User.self).filter("userID == '\(self.EmailAddress.text!)'")
                        //
                        //                        if users.count != 0 {
                        //
                        //                            let savedUser = users[0]
                        //
                        //                            if savedUser.password == self.Password.text! {
                        //
                        //                                User.sharedInstance = savedUser
                        //                                self.performSegue(withIdentifier: "SuccessLogin", sender: nil)
                        //
                        //                            }else{
                        //
                        //                                alert(self, title: "Error!", Description: "Wrong password!")
                        //                            }
                        //
                        //
                        //
                        //                        }else{
                        //
                        //                            alert(self, title: "Error!", Description: error!)
                        //                            
                        //                        }
                        
                    }else{
                        
                        alert(self, title: "Error!", Description: error!)
                        
                        
                    }
                    
                    alert(self, title: "Error!", Description: error!)
                }
                Loader.Stop()
            }
            
        }else{
            alert(self, title: "Error!", Description: "SignUp field(s) Can't be Blank!")
            
        }
        
        
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
