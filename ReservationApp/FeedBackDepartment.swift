//
//  FeedBackDepartment.swift
//  ReservationApp
//
//  Created by Sabir Shah on 11/1/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class FeedBackDepartment: NSObject {

     var CategoryID : Int!
     var FeedBackID : Int?
     var Comments: String! = ""
     var Photx64:String! = ""
    
    init(CategoryID:Int!,FeedBackID:Int?,Comments: String!,Photx64: String){
        
        self.CategoryID = CategoryID
        self.FeedBackID = FeedBackID
        self.Comments = Comments
        self.Photx64 = Photx64
        
 }
}
