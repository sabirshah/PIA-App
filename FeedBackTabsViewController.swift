//
//  FeedBackTabsViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 3/20/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

    
    import UIKit
    import WillowTreeScrollingTabController
    
    
    class FeedbackTabsViewController: UIViewController  {
        
        var scrollTab = ScrollingTabController()
        var department_id = 0
        var viewControllers: [UIViewController] = []
        
        @IBOutlet weak var scrollContainer: UIView!
        override func viewWillAppear(_ animated: Bool) {
            
                 }
        override func viewDidAppear(_ animated: Bool) {
            
            
        }
        
   
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.automaticallyAdjustsScrollViewInsets = false;
            
            buildViewControllers()
            
            
          //  scrollTab.delegate = self
            scrollTab.willMove(toParentViewController: self)
            addChildViewController(scrollTab)
            scrollTab.viewControllers = viewControllers
            scrollTab.view.translatesAutoresizingMaskIntoConstraints = false
            scrollContainer.addSubview(scrollTab.view)
            scrollContainer.layoutIfNeeded()
            
            let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "|[view]|", options: [], metrics: nil, views: ["view": scrollTab.view])
            let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: [], metrics: nil, views: ["view": scrollTab.view])
            NSLayoutConstraint.activate(horizontal + vertical)
            
            scrollTab.didMove(toParentViewController: self)
           // scrollTab.centerSelectTabs = centerSelectSwitch.isOn
           
            //scrollTab.selectTab(atIndex: 0)


          //
            
            //        if(SearchBy == 1) // Flight Status is clicked
            //        {
            //            self.title = "Flight Status"
            //            scrollTab.selectTab(atIndex: 1)
            //
            //        }
            //        else
            //        {
            //            self.title = "Flight Schedule"
            //            scrollTab.selectTab(atIndex: 0)
            //
            //
            //        }
            
            
        }
        
        
        func buildViewControllers() {
            viewControllers.removeAll()
            for i in 1...10 {
                let viewController = FeedbackTabViewController()
                
                var color = UIColor.white
                switch i % 5 {
                case 0:
                    color = UIColor.red
                case 1:
                    color = UIColor.blue
                case 2:
                    color = UIColor.green
                case 3:
                    color = UIColor.orange
                case 4:
                    color = UIColor.purple
                default:
                    color = UIColor.white
                }
                viewController.view.backgroundColor = color
                //viewController.itemTextLabel.text = "\(i)"
                viewController.tabBarItem.title = "VC \(i)"
                
                viewControllers.append(viewController)
            }
        }

        
        func buildViewControllers2() {
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tab1ViewController = storyboard.instantiateViewController(withIdentifier: "Tab1Controller") as! FeedbackTabViewController
            let tab2ViewController = storyboard.instantiateViewController(withIdentifier: "Tab2Controller") as! FeedbackTabViewController
            let tab3ViewController = storyboard.instantiateViewController(withIdentifier: "Tab3Controller") as! FeedbackTabViewController
            let tab4ViewController = storyboard.instantiateViewController(withIdentifier: "Tab4Controller") as! FeedbackTabViewController
            let tab5ViewController = storyboard.instantiateViewController(withIdentifier: "Tab5Controller") as! FeedbackTabViewController
            let tab6ViewController = storyboard.instantiateViewController(withIdentifier: "Tab6Controller") as! FeedbackTabViewController
            let tab7ViewController = storyboard.instantiateViewController(withIdentifier: "Tab7Controller") as! FeedbackTabViewController
            let tab8ViewController = storyboard.instantiateViewController(withIdentifier: "Tab8Controller") as! FeedbackTabViewController
            let tab9ViewController = storyboard.instantiateViewController(withIdentifier: "Tab9Controller") as! FeedbackTabViewController
             let tab10ViewController = storyboard.instantiateViewController(withIdentifier: "Tab10Controller") as! FeedbackTabViewController
           // "AIRPORT CHECK-IN","RESERVATION","LOUNGE FACILITIES","BAGGAGE HANDLING","TRANSIT SERVICES","IN-FLIGHT ENTERTAINMENT","CABIN CREW COURTESY","FOOD AND BEVERAGES","TOILETS","CABIN COMFORT","MISCELLANEOUS"
            
            tab1ViewController.tabBarItem.title = "AIRPORT CHECK-IN"
            tab2ViewController.tabBarItem.title = "RESERVATION"
            tab3ViewController.tabBarItem.title = "LOUNGE FACILITIES"
            tab4ViewController.tabBarItem.title = "BAGGAGE HANDLING"
            tab5ViewController.tabBarItem.title = "TRANSIT SERVICES"
            tab6ViewController.tabBarItem.title = "IN-FLIGHT ENTERTAINMENT"
            tab7ViewController.tabBarItem.title = "CABIN CREW COURTESY"
            tab8ViewController.tabBarItem.title = "FOOD AND BEVERAGES"
            tab9ViewController.tabBarItem.title = "TOILETS"
            tab10ViewController.tabBarItem.title = "CABIN COMFORT"


            
            
            
            
            viewControllers = [tab1ViewController,tab2ViewController,tab3ViewController,tab4ViewController,tab5ViewController,tab6ViewController,tab7ViewController,tab8ViewController,tab9ViewController,tab10ViewController]
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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

