//
//  User.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/23/23.
//

import Foundation
import FirebaseAuth

class User: ObservableObject{
    @Published var id : String = UUID().uuidString
    @Published var username : String
    @Published var password : String
    @Published var loggedIn : Bool = false
    
    init(username: String = "", password: String = ""){
        self.username = username
        self.password = password
        
        Auth.auth().addStateDidChangeListener{_, user in
            guard let user = user else {return}
            
            self.username = user.email ?? ""
            
            self.loggedIn = true
        }
    }
}
