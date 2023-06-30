//
//  FetchData.swift
//  JSON
//
//  Created by Owen Bress (student LM) on 12/13/22.
//

import Foundation
import FirebaseDatabase
import UserNotifications

class FetchData: ObservableObject{
    
    let ref = Database.database().reference()
    
//    @Published var response: Response = Response()
//
//    func getData() async{
//        let URLString = "https://eventlm-default-rtdb.firebaseio.com/"
//        guard let url = URL(string: URLString) else {return}
//
//        do{
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            let r = try JSONDecoder().decode(Response.self, from: data)
//            self.response = r
//        }catch{
//            print(error)
//
//        }
//
//    }
//    func getData(){
//        ref.child("schedule").child.("Swimming").observeSingleEvent(of: .value, with: { snapshot in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//
//            // ...
//          }) { error in
//            print(error.localizedDescription)
//          }

}

//MAKE VARIABLES LOWERCASE IN FIREBASE OR NO WORK!!!!!!

struct Response: Codable{
    var results: [Results] = []
    var schedule: [Schedule] = []
    var userInfo: [LMUserInfo] = []
}

//RESULTS PATH
struct Results: Codable{
    var teams: [rTeam] = []
}
//ALL SPORTS TEAMS
struct rTeam: Codable{
    var baseball : rBaseball = rBaseball()
}
//ALL GAMES FOR THAT TEAM
struct rBaseball: Codable{
    var game : [rGame] = [rGame()]
}
//INFORMATION ABOUT GAME
struct rGame : Codable{
    //CHANGE NAME OF +Info variable to remove + symbol
    var eInfo : String = ""
    var date : String = "3/12/23"
    var location : String = "Penn Wynne Park"
    
    //true = team1 won, false = team2 won
    
    //var winner : Bool
}
//SCORE OF GAME
struct Score: Codable{
    //CHANGE TEAMS TO INTS
    var team1 : Int = 5
    var team2 : Int = 3
}

//SCHEDULE PATH
struct Schedule: Codable{
    var team : [sTeam] = [sTeam()]
}
//DIFFERENT SPORTS TEAMS
struct sTeam: Codable{
    var baseball : sBaseball = sBaseball()
}
//ALL GAMES FOR THAT TEAM
struct sBaseball: Codable{
    var game : [sGames] = [sGames()]
}
//INFOMRATION ABOUT GAME
struct sGames: Codable{
    var eInfo : String = ""
    var date : String = "3/12/23"
    var location : String = "Penn Wynne Park"
    
}

//USERINFO PATH
struct LMUserInfo: Codable{
    var userID : String = ""
    var favorites : [Bool] = []
    //var notifications:
    var admin : Bool = false
}
