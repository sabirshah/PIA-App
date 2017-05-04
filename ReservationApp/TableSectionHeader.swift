//
//  TableSectionHeader.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/7/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class TableSectionHeader: UITableViewHeaderFooterView  {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var OriginLabel: UILabel!

   
    @IBOutlet weak var WayImage: UIImageView!
    @IBOutlet weak var DestinationLabel: UILabel!
}
