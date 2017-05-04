//  Custombutton.swift
//  ReservationApp
//
//  Created by Admin on 11/08/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

@IBDesignable class Custombutton: UIButton {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let square = UIBezierPath(rect: rect)
        square.stroke()

    }

}
