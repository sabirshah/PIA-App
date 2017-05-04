//
//  MenuTableViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/3/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
@IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var LogoutCell: UITableViewCell!
    @IBOutlet weak var TopCell: UITableViewCell!
    
    @IBOutlet weak var SignText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    
        TopCell.contentView.backgroundColor = UIColor(hex6: 0x004f30)
        
        if let user = User.sharedInstance {
         
            
            let prefs:UserDefaults = UserDefaults.standard
            
            let verified = prefs.bool(forKey: "VERIFIED")
            if verified == true {
                
                self.profileName.text = prefs.string(forKey: "USERNAME")
                self.profileEmail.text = prefs.string(forKey: "EMAIL")
                
            }
            
            
            //LogoutCell.isHidden = false
           SignText.text = "Sign Out"
        }else{
//            self.profileName.alpha=1
            //LogoutCell.isHidden = true
            
            
            let prefs:UserDefaults = UserDefaults.standard
            prefs.set(false, forKey: "VERIFIED")
            
            
            SignText.text = "Sign In"

        }

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidLayoutSubviews() {
       
        Picture.layer.masksToBounds=false
        Picture.layer.cornerRadius = Picture.frame.size.width/2
        Picture.clipsToBounds=true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (indexPath as NSIndexPath).row == 6{
            if  SignText.text == "Sign Out"
            {
            User.sharedInstance=nil
                let prefs:UserDefaults = UserDefaults.standard
                prefs.set(false, forKey: "VERIFIED")
                 prefs.synchronize()
                
             performSegue(withIdentifier: "FScreenSegue", sender: nil)
            //self.navigationController?.popToRootViewController(animated: true)
            }
            else
            {
                //performSegue(withIdentifier: "FScreenSegue", sender: nil)
                performSegue(withIdentifier: "SLoginSegue", sender: nil)
                
            }
            
        }
        
    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
