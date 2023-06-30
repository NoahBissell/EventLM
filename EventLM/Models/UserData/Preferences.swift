//
//  User.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/23/23.
//

import Foundation
import FirebaseAuth

class Preferences: ObservableObject{
    //0 - Boys
    //1 - Girls
    @Published var gender : (Bool,Bool) = (true,true)
    
    //0 - Varsity
    //1 - Junior Varsity
    @Published var level : (Bool, Bool) = (true,true)
    
    //    1 "soccer":
    //    2 "basketball":
    //    3 "football":
    //    4 lacrosse":
    //    5 "swimming":
    //    6 "volleyball"
    //    7 "wrestling":
    //    8 "field hockey"
    @Published var sports : [Bool] = [
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true,
        true
    ]
    
    @Published var activeSports : [String:Bool] = [
        "soccer":true,
        "basketball":true,
        "football":true,
        "lacrosse":true,
        "swimming":true,
        "volleyball":true,
        "wrestling":true,
        "tennis":true,
        "field hockey":true
    ]
    
    //If change is true means you are
    func changeSport(name : String) -> Void{
        if let bool = activeSports[name] {
            activeSports[name] = !bool
        }
    }
    

   
}
