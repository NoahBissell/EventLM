//
//  SetData.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/7/23.
//

import Foundation
//
//  ResultsView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/28/23.
//
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
//import FirebaseDatabasSwift
// This class is what is actually updating the information in Firebase.
class setData: ObservableObject{
    
    private let ref = Database.database().reference()
    var dictionary: [String: Any]{
        ["date" : "",
         "name" : "",
         "location" : "",
         "price" : "",
         "time" : ""
        ]
    }
    // Kind of usless right now in my opinion
    func setTeams(dictionary : [String: Any]){
        self.ref.child("results").setValue(self.dictionary)
    }

    // Actually important function that we call upon in order to set the information in firebase
    func setObject(id : String, date : String, time : String, location : String , price : String){
        var generateObject = Event()
        generateObject.id = id
        generateObject.date = date
        generateObject.time = time
        generateObject.location = location
        generateObject.price = price
//        generateObject.spiritWearDescription = "Blue"
//
        ref.child("schedule/\(id)").setValue(generateObject.toDictionary)
    }
}
