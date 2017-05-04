//
//  PNRTableViewCell.swift
//  ReservationApp
//
//  Created by Nano Degree on 06/12/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class PNRTableViewCell: UITableViewCell {

    @IBOutlet weak var FlightStatus: UILabel!
    @IBOutlet weak var FlightClass: UILabel!
    @IBOutlet weak var ArrivalTime: UILabel!
    @IBOutlet weak var DepartTime: UILabel!
    @IBOutlet weak var DestinationName: UILabel!
    @IBOutlet weak var DestinationCode: UILabel!
    @IBOutlet weak var OriginName: UILabel!
    @IBOutlet weak var OriginCode: UILabel!
    @IBOutlet weak var FlightDate: UILabel!
    @IBOutlet weak var FlightNo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
