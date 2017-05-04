//
//  PricingTableViewCell.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/5/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit
import FoldingCell
class PricingTableViewCell: FoldingCell {

    
    @IBOutlet weak var CloseFlightNo: UILabel!
    
    @IBOutlet weak var CloseDepartTime: UILabel!
    @IBOutlet weak var CloseArrTime: UILabel!
    @IBOutlet weak var ClosePrice: UILabel!
    @IBOutlet weak var CloseCurrency: NSLayoutConstraint!
    @IBOutlet weak var OpenFlightNo: UILabel!
    
    @IBOutlet weak var Origin: UILabel!
    
    @IBOutlet weak var Destination: UILabel!
    
    @IBOutlet weak var DepartureDate: UILabel!
    
    @IBOutlet weak var SeatAvailibility: UILabel!
    @IBOutlet weak var Equipment: UILabel!
    @IBOutlet weak var Meal: UILabel!
    @IBOutlet weak var ArrivalDate: UILabel!
    var number: Int = 0 {
        didSet {
            
           // closeNumberLabel.text = String(number)
           // openNumberLabel.text = String(number)
        }
    }
    
    override func awakeFromNib() {
        
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        
        super.awakeFromNib()
    }

   

   
    override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
        
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }

}
