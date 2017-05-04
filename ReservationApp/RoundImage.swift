//
//  RoundImage.swift
//  ReservationApp
//
//  Created by Sabir Shah on 8/18/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

    @IBDesignable class RoundImage: UIImageView {
        @IBInspectable var cornerRadius: CGFloat = 20.0 {
            didSet {
                self.layer.cornerRadius = cornerRadius
                self.layer.masksToBounds = true
            }
        }
}
