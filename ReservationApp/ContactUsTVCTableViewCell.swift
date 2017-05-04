//
//  ContactUsTVCTableViewCell.swift
//  ReservationApp
//
//  Created by Sabir Shah on 11/28/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class ContactUsTVCTableViewCell: UITableViewCell {

    @IBOutlet weak var CountryName: UILabel!
    @IBOutlet weak var CountryNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
