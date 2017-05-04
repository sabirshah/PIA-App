//
//  Tab1ViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 3/20/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController {

    @IBOutlet weak var submitButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.isEnabled = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitClicked(_ sender: Any) {
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
