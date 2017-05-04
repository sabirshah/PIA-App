//
//  infoTVC.swift
//  ReservationApp
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class infoTVC: UITableViewController {

    @IBOutlet weak var menubutton: UIBarButtonItem!
    var row = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let textLabel = tableView.cellForRow(at: indexPath)?.contentView.subviews[0] as! UILabel
        row = indexPath.row
        self.performSegue(withIdentifier: "showInfo", sender: textLabel.text!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! detailVC
        dest.title = sender as! String
        dest.InfoId = row
     
    }
    @IBAction func openHome(_ sender: AnyObject) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

    }
}
