//
//  Path.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/15/23.
//

import Foundation

class Path : ObservableObject {
    @Published var pathChanged = false
    @Published var path : [String] = ["schedule"]
    var lastSport : String = "soccer"
    
    func addPath (aPath : String )  {
        path.append(aPath)
    }
    
    func remPath () {
        path.popLast()
        
    }
    func remAllPath () {
        path.removeAll()
        
    }
    
    func change(){
        pathChanged = !pathChanged
    }
    func fPath() -> String{
        return path.joined(separator: "/")
    }
        
}
