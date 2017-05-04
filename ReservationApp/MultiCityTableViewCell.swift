//
//  MultiCityTableViewCell.swift
//  ReservationApp
//
//  Created by Sabir Shah on 1/17/17.
//  Copyright © 2017 Pakistan International Airlines. All rights reserved.
//

import UIKit

class MultiCityTableViewCell: UITableViewCell {

    @IBOutlet weak var Origin: UIButton!
 
    @IBOutlet weak var OriginText: UIButton!
    
    @IBOutlet weak var Destination: UIButton!
    
    @IBOutlet weak var DestinationText: UIButton!
    
    @IBOutlet weak var DepartureDate: UIButton!
    
    @IBOutlet weak var MultiDate: UIButton!

    @IBOutlet weak var DeleteView: UIView!
    
    @IBOutlet weak var AddView: UIView!
    @IBOutlet weak var AddButton: UIImageView!
    @IBOutlet weak var AddButtonText: UILabel!
    @IBOutlet weak var DeleteButton: UIImageView!
    @IBOutlet weak var DeleteButtonText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
