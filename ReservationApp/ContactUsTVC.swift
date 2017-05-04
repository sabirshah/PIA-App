//
//  ContactUsTVC.swift
//  ReservationApp
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class ContactUsTVC: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
   
    var PhoneNumDictionary:[Int:[String]] =
        [0:["+9221111786786","Pakistan"],1:["+18443155983","Canada"],
    2:["+864008429107","China"],3:["+33800900561","France"],
    4:["+498007548631","Germany"],5:["+39800561922","Italy"],
    6:["+601800808216","Malaysia"],7:["+318002658700","Netherlands"],
    8:["+4780069393","Norway"],9:["+9668008500150","Saudi Arabia"] ,
    10:["+9668008147002","Saudi Arabia"],11:["+658008523446","Singapore"],
    12:["+34904:0373179","Spain"],13:["+6618008527261","Thailand"],
    14:["+97180009140002"," UAE"],15:["+448082346321", "United Kingdom"],
    16:["+18446825260", "USA"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
    }
    
    @IBAction func home(_ sender: AnyObject) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        present(controller, animated: true,completion: nil)
    }

    @IBAction func openHone(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return PhoneNumDictionary.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ContactUsTVCTableViewCell
        
        cell.CountryName.text = PhoneNumDictionary[indexPath.row]?[1]
        cell.CountryNumber.text = PhoneNumDictionary[indexPath.row]?[0]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let no = tableView.cellForRow(at: indexPath)?.contentView.subviews[2] as! UILabel
        print(no.text)
        UIApplication.shared.openURL(URL(string: "tel://\(no.text!)")!)
        
    }
}
