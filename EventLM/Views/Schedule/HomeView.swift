//
//  HomeView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/28/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var preferences : Preferences
    @Binding var viewState : ViewState
    @EnvironmentObject var path : Path
    @State var events: [(id: UUID, key: String, value: AnyObject)] = []
    @State var logos : [String] = ["Haverford", "Penncrest", "Ridley", "Strath Haven", "Garnet Valley", "Conestoga", "Radnor", "Harriton"]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Background 4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical){
                        VStack(spacing:3) {
                            ForEach(events, id: \.id) { e in
                                if let event = e.value as? [String: String]{
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.black.opacity(0.2))
                                            .cornerRadius(30)
                                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/4.75)
                                        HStack(spacing: 20){
                                            VStack(spacing: 5){
                                                
                                                Text("\(event["sport"] ?? "")") // Problem here the text is not individual.
                                                    .font(Constants.MediumFont)
                                                    .foregroundColor(.accentColor)
                                                    .offset(y:UIScreen.main.bounds.height/65)
                                                
                                                
                                                HStack(){
                                                    Image("LMLogo")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(height: UIScreen.main.bounds.height/13)
                                                        .cornerRadius(4)
                                                        .padding(.vertical, 5)
                                                    
                                                    VStack(alignment: .leading, spacing: 5){
                                                        Text(event["team1"] ?? "?")
                                                            .font(Constants.HomeFont)
                                                            .foregroundColor(.black)
                                                            .lineLimit(2)
                                                            .minimumScaleFactor(0.75)
                                                    }
                                                }
                                                HStack(){
                                                    if logos.contains(event["name"] ?? "?" ){
                                                        Image(event["name"] ?? "badLogo")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: UIScreen.main.bounds.height/15)
                                                            .cornerRadius(4)
                                                            .padding(.vertical, 5)
                                                            .padding(.horizontal, 5)
                                                    }
                                                    else{
                                                        Image("Unknown")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: UIScreen.main.bounds.height/15)
                                                            .cornerRadius(4)
                                                            .padding(.vertical, 5)
                                                    }
                                                    
                                                    VStack(alignment: .leading, spacing: 5){
                                                        Text(event["team2"] ?? "?")
                                                            .font(Constants.HomeFont)
                                                            .foregroundColor(.black)
                                                            .lineLimit(2)
                                                            .minimumScaleFactor(0.75)
                                                        
                                                    }
                                                }
                                                
                                            }
                                            Rectangle()
                                                .frame(width: 2, height: UIScreen.main.bounds.height/6)
                                                .foregroundColor(.black.opacity(0.4))
                                            VStack {
                                                Text("Level: ")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.accentColor)
                                                Text("\(event["gender"] ?? "") \(event["level"] ?? "")")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.secondary)
                                                Text("Date: ")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.accentColor)
                                                Text(event["date"] ?? "?")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.secondary)
                                                Text("Time: ")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.accentColor)
                                                Text(event["time"] ?? "?")
                                                    .font(Constants.SmallFont)
                                                    .foregroundColor(.secondary)
                                                
                                            }
                                            NavigationLink{
                                                EventView(event: event)
                                            }label: {
                                                Image(systemName: "plus.rectangle")
                                                    .font(.system(size: UIScreen.main.bounds.width/14))
                                                    .foregroundColor(.black)
                                            }
                                            
                                            
                                        }
                                    }
                                }
                            }
                        }
                        
                    }.navigationTitle("Schedule")
                
            }
        }
        .task {
            events = []
            //BOYS
            
            if preferences.gender.1{
                path.remAllPath()
                path.addPath(aPath: "schedule")
                path.addPath(aPath: "girls")
                //GATHERS ALL EVENTS UNDER EACH SPORTS IN SCHEDULE AND SORTS BY DATE
                getData.getSortedScheduled(preferences: preferences, path: path) { sortedEvents in
                    DispatchQueue.main.async {
                        events += sortedEvents
                    }
                }
                
            }
            if preferences.gender.0{
                let path2 : Path = Path()
                path2.remAllPath()
                path2.addPath(aPath: "schedule")
                path2.addPath(aPath: "boys")
                
                //GATHERS ALL EVENTS UNDER EACH SPORTS IN SCHEDULE AND SORTS BY DATE
                getData.getSortedScheduled(preferences: preferences, path: path2) { sortedEvents in
                    DispatchQueue.main.async {
                        events += sortedEvents
                    }
                }
                
            }
            DispatchQueue.main.async {
                
                events = ManageData.sortArray(array: events, ascending: true)
            }
        }
    }
    
    
}

//CONVERT DICTIONARY TO TUPLE


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewState: Binding.constant(ViewState.authentication))
            .environmentObject(Path())
            .environmentObject(Preferences())
        
    }
}
