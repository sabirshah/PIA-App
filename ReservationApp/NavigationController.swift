//
//  NavigationController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 10/10/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationBar.barStyle = UIBarStyle.blackOpaque
        self.navigationBar.tintColor = UIColor.white
        
        
        self.navigationBar.backgroundColor =  UIColor(hex6: 0x004f30)

        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
       // self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
//        self.navigationBar.titleTextAttributes =
//            ([NSFontAttributeName: UIFont(name: "AppleSDGothicNeo-Thin", size:28)!,
//              NSForegroundColorAttributeName: UIColor(rgba: "#ffffff")])
        
        
        self.navigationBar.tintColor = UIColor(rgba: "#ffffff")
        

        
        
        
        
        
        
    }
}
