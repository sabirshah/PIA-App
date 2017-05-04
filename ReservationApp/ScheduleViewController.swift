
//
//  ScheduleViewController.swift
//  ReservationApp
//
//  Created by Admin on 28/07/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import WillowTreeScrollingTabController


class ScheduleViewController: UIViewController {

    @IBOutlet weak var scrollContainer: UIView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var SearchBy:Int?
    var scrollTab = ScrollingTabController()
    
    var viewControllers: [UIViewController] = []

    override func viewWillAppear(_ animated: Bool) {
           }
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = UIApplication.shared.keyWindow!.frame.width * 0.85
        }
        buildViewControllers()

        scrollTab.tabView.selectionIndicatorOffset = 1
        scrollTab.tabView.selectionIndicatorHeight=4
        scrollTab.tabView.selectionIndicator.backgroundColor = UIColor(hex6: 0xbfa218)
        scrollTab.tabView.backgroundColor = UIColor(hex6: 0x004f30)

        scrollTab.willMove(toParentViewController: self)
        addChildViewController(scrollTab)
        scrollTab.viewControllers = viewControllers
        scrollTab.view.translatesAutoresizingMaskIntoConstraints = false
        scrollContainer.addSubview(scrollTab.view)
        let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: [], metrics: nil, views: ["view": scrollTab.view])
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": scrollTab.view])
        NSLayoutConstraint.activate(horizontal + vertical)
        scrollTab.didMove(toParentViewController: self)
        scrollTab.tabView.tabSizing = .fitViewFrameWidth
        
        if(SearchBy == 1) // Flight Status is clicked
        {
            self.title = "Flight Status"
            scrollTab.selectTab(atIndex: 1)

        }
        else
        {
            self.title = "Flight Schedule"
            scrollTab.selectTab(atIndex: 0)

            
        }

        
    }
    
    @IBAction func HomeClick(_ sender: AnyObject) {
        
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
    }
    func buildViewControllers() {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)        
        let scheduleViewcontroller = storyboard.instantiateViewController(withIdentifier: "schedule") as! ScheduleSearchViewController
        let flightStatusViewcontroller = storyboard.instantiateViewController(withIdentifier: "flightStatus") as! FlightNoSearchViewController

        
        scheduleViewcontroller.tabBarItem.title = "Flight Schedule"
        flightStatusViewcontroller.tabBarItem.title = "Flight Status"
        
        viewControllers = [scheduleViewcontroller,flightStatusViewcontroller]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openHome(_ sender: AnyObject) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: "RevealViewController") as! SWRevealViewController
        
        present(controller, animated: true,completion: nil)
        
        

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
