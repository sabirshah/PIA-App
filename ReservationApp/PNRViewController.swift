//
//  PNRViewController.swift
//  ReservationApp
//
//  Created by Muhammad Tousif Shahid on 7/21/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
////import RealmSwift


//class PNR : Object{
//dynamic var pnr = ""
//
//}


class PNRViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    
    @IBOutlet weak var ProceedButton: UIButton!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var textPNR: UITextField!
    
    
    @IBOutlet weak var tableview: UITableView!
    var paxNamesArr = [String]()
    var ticketNumArr = [String]()
    var flightDetailArr = [String]()
    
    var sectionTitleArr = ["Passenger(s)", "Itinerary", "Ticket(s) & PNR Expiry"]
    
    
    let kCloseCellHeight: CGFloat = 20
    let kOpenCellHeight: CGFloat = 40
    
    let kRowsCount = 5

    var cellHeights = [CGFloat]()

    
    
    @IBAction func PNRDetail(_ sender: AnyObject) {

        
    }
    
    @IBAction func openHome(_ sender: AnyObject) {
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
        
        case 1: return 6
            
        default : return 1
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        /*let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PNRFoldingCell
        var duration = 0.0

        if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
            cellHeights[indexPath.row] = kOpenCellHeight
            cell.selectedAnimation(true, animated: true, completion: nil)
            duration = 0.5
        } else {// close cell
            cellHeights[indexPath.row] = kCloseCellHeight
            cell.selectedAnimation(false, animated: true, completion: nil)
            duration = 1.1
        }
        
        UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
            self.foldingTableView.beginUpdates()
            self.foldingTableView.endUpdates()
            }, completion: nil)
        */
      /*  if indexPath.section == 0 {
            cell.textLabel?.text = self.paxNamesArr[indexPath.row]
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text=self.flightDetailArr[indexPath.row]
        }
        else
        {
            cell.textLabel?.text=self.ticketNumArr[indexPath.row]
        }
        
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.minimumScaleFactor = 0.1
        cell.textLabel?.font = UIFont.systemFontOfSize(11.0)
        cell.textLabel?.textColor=UIColor.blueColor()*/
        
        return cell
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.sectionTitleArr.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.paxNamesArr.count
        }
        
        else if section == 1 {
            return self.flightDetailArr.count
        }
        else
        {
            return self.ticketNumArr.count
        }
    
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.sectionTitleArr[section]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         ProceedButton.backgroundColor = UIColor(hex6: 0x004f30)
        //self.textPNR.delegate = self

//        textPNR.resignFirstResponder()
        // Do any additional setup after loading the view.
        
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }

    
    
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return false
    }
    @IBAction func ProceedClick(_ sender: AnyObject) {
        
     
//        let realm = try! Realm()
        
        //let theDog = realm.objects(Dog.self).filter("age == 1").first
     //   let userdefaults = UserDefaults.standard
     //   userdefaults.set(BookingDetails.self, forKey: "BookingDetails")
        
//        try! realm.write {
//            realm.add(BookingDetails.self)
//        }
//        
        
    
        
         if textPNR.text != "" {
            Loader.Start(self)
            GetPNRService.GetPNR(textPNR.text!, completion: { (pnr, error) in
                
                if error == nil{
                    if((pnr?.flightsPNRArray.count)! > 0)
                    {
                    self.performSegue(withIdentifier: "showPaxInfo", sender: pnr)
                    }
                    else if ((pnr?.passangerPNRArray.count)! > 0)
                    {
                        
                        self.textPNR.text = ""
                      alert(self, title: "Info!", Description: "Already travelled.")
                    }
                    
                }else{
                    
                    alert(self, title: "Error!", Description: error!)
                }
                Loader.Stop()
            })
            
        }else{
            
            alert(self, title: "Error!", Description: "Invalid PNR!")
        }

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

    @IBAction func tap(_ sender: AnyObject) {
        
        self.textPNR.resignFirstResponder()

    }
    
    // MARK: - Navigation

   //  In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
      //   Pass the selected object to the new view controller.
        if segue.identifier == "showPaxInfo"
        {
            if let viewController: PNRDetailViewController = segue.destination as?  PNRDetailViewController  {
                viewController.pnr = textPNR.text!
                viewController.booking = sender as? BookingDetails
                //viewController.paxNamesArr = paxNamesArr
                //viewController.ticketNumArr = ticketNumArr
                
           }
        }
        
    }
 

}
