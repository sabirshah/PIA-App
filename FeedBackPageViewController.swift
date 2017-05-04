//
//  FeedBackPageViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 2/9/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FeedBackPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    //var pageHeadings = ["Personalize", "Locate", "Discover"]
        var pageHeadings = ["AIRPORT CHECK-IN","RESERVATION","LOUNGE FACILITIES","BAGGAGE HANDLING","TRANSIT SERVICES","IN-FLIGHT ENTERTAINMENT","CABIN CREW COURTESY","FOOD AND BEVERAGES","TOILETS","CABIN COMFORT","MISCELLANEOUS"]

    
   // var pageContent = ["Pin your favorite restaurants and create your own food guide",
                      //     "Search and locate your favourite restaurant on Maps",
                     //      "Find restaurants pinned by your friends and other foodies around the world"]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the data source to itself
            dataSource = self
            
            // Create the first walkthrough screen
            if let startingViewController = viewControllerAtIndex(0) {
                setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        // MARK: - UIPageViewControllerDataSource
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            var index = (viewController as! FeedbackTabViewController).index
            index += 1
            
            return viewControllerAtIndex(index)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            var index = (viewController as! FeedbackTabViewController).index
            index -= 1
            
            return viewControllerAtIndex(index)
        }
        
        func viewControllerAtIndex(_ index: Int) -> FeedbackTabViewController? {
            
            if index == NSNotFound || index < 0 || index >= pageHeadings.count {
                return nil
            }
            
            // Create a new view controller and pass suitable data.
            if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "FeedbackTabViewControllerID") as? FeedbackTabViewController {
                
                //pageContentViewController.imageFile = pageImages[index]
                
                pageContentViewController.heading = pageHeadings[index]
               // pageContentViewController.content = pageContent[index]
                pageContentViewController.index = index
                self.title = pageHeadings[index]
                return pageContentViewController
            }
            
            return nil
        }
        
        func forward(_ index:Int) {
            if let nextViewController = viewControllerAtIndex(index + 1) {
                setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
            }
        }
        
        // For default page indicator
        /*
         func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
         return pageHeadings.count
         }
         
         func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
         if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("FeedbackTabViewController") as? FeedbackTabViewController {
         
         return pageContentViewController.index
         }
         
         return 0
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
