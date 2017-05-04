//
//  Loader.swift
//  ReservationApp
//
//  Created by Admin on 28/07/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import DGActivityIndicatorView

class Loader
{
    
    static fileprivate var  jeremyGif: UIImage!
    static fileprivate var imageView: UIImageView!
    static fileprivate var backgroudView: UIView!
    static fileprivate var cirlceView: UIView!
//    static var activity = DGActivityIndicatorView(type: .BallClipRotatePulse, tintColor:UIColor(red: 47/255, green: 124/255, blue: 21/255, alpha: 1) , size: 60)

    
    static func Start(_ viewcontroller:UIViewController) {
        
      
//        activity.frame = CGRect(x: 0.0, y: 0, width: 70, height: 70)
//        activity.center = UIApplication.sharedApplication().keyWindow!.center
        
        self.backgroudView = UIView(frame:   UIApplication.shared.keyWindow!.frame)
        self.backgroudView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0)
        
        jeremyGif = UIImage.gifWithName("yellow")
        imageView = UIImageView(image: jeremyGif)
        imageView.frame = CGRect(x: 0.0, y: 0, width: 65, height: 65)
        imageView.center = UIApplication.shared.keyWindow!.center
        
        
        
        cirlceView = UIView(frame: CGRect(x: 0.0, y: 0, width: 75, height: 75))
        cirlceView.backgroundColor = UIColor.white
        cirlceView.center = UIApplication.shared.keyWindow!.center
        cirlceView.layer.cornerRadius = 10
        cirlceView.layer.borderWidth = 2
        cirlceView.layer.borderColor = UIColor(red: 47/255, green: 124/255, blue: 21/255, alpha: 1).cgColor
//        self.activity.alpha=1
//        self.cirlceView.alpha=1
        
        
        self.backgroudView.addSubview(cirlceView)
        self.backgroudView.addSubview(imageView)
        UIApplication.shared.keyWindow!.addSubview(self.backgroudView)
//        activity.startAnimating()
//
    }
    
    static func Stop() {
////        
//        UIView.animateWithDuration(0.5, animations: {
//            
//        
//            self.activity.alpha=0
//            self.cirlceView.alpha=0
            self.backgroudView.removeFromSuperview()
        self.imageView.removeFromSuperview()
        self.cirlceView.removeFromSuperview()

//        }) { (flag) in
//            self.activity.stopAnimating()

//        }
        

        
        
    }
    
}
