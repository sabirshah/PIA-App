//
//  FlightNumberTableViewCell.swift
//  ReservationApp
//
//  Created by Sabir Shah on 3/27/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FlightNumberTableViewCell: UITableViewCell {

    @IBOutlet weak var OriginName: UILabel!
    @IBOutlet weak var FlightNumber: UILabel!
    @IBOutlet weak var OriginCode: UILabel!
    @IBOutlet weak var DestinationName: UILabel!
    @IBOutlet weak var DestinationCode: UILabel!
    @IBOutlet weak var DeptTime: UILabel!
    @IBOutlet weak var ArrivalTime: UILabel!
    @IBOutlet weak var DeptDate: UILabel!
    @IBOutlet weak var ArrDate: UILabel!
    @IBOutlet weak var ActualDeptTime: UILabel!
    @IBOutlet weak var ActualArrTime: UILabel!
    @IBOutlet weak var Message: UILabel!
    @IBOutlet weak var MessageDetail1: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
