//
//  ScheduleDetailTableViewCell.swift
//  ReservationApp
//
//  Created by Sabir Shah on 3/31/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class ScheduleDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var CarrierImage: UIImageView!
    @IBOutlet weak var FlightNumber: UILabel!
   
    @IBOutlet weak var Stops: UILabel!
    @IBOutlet weak var Aircraft: UILabel!
    @IBOutlet weak var DepartureDate: UILabel!
    @IBOutlet weak var DepartureTime: UILabel!
    @IBOutlet weak var ArrivalDate: UILabel!
    @IBOutlet weak var ArrivalTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
