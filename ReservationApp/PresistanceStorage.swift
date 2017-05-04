//
//  PresistanceStorage.swift
//  ReservationApp
//
//  Created by Admin on 10/08/2016.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

class PresistanceStorage {

    
    
     fileprivate static var defaults = UserDefaults.standard
    
    
    
    static func save(_ value:AnyObject , key:String){
        defaults.set(value, forKey: key)
    }
    
    static func getValue(_ key:String)->AnyObject?{
        
        if let value = defaults.value(forKey: key){
   
            return value as AnyObject?
        }

        return nil
    }

}

class PresistanceStorageForPNR {
    
    fileprivate static let defaults = UserDefaults.standard
    
    
    static func saveData(_ data:AnyObject , key:String){
        
        
        let arr = NSKeyedArchiver.archivedData(withRootObject: data)
        self.defaults.set(arr, forKey: key)
        
        
        
    }
    
    static func fetchData(_ key:String , completion:(_ data:AnyObject? , _ error:String?)->Void){
        
        if let data = self.defaults.object(forKey: key) as? Data{
            
            let arr =  NSKeyedUnarchiver.unarchiveObject(with: data)
            completion(arr as AnyObject? ,nil)
            
        }else{
            
            completion(nil ,"Not Found!")
            
        }
    }
    
    static func removeData(){
        
        for key in Array(self.defaults.dictionaryRepresentation().keys) {
            self.defaults.removeObject(forKey: key)
        }
    }
    
}
