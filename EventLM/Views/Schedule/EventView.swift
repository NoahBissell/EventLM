//
//  EventView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/28/23.
// DETAIL OF HOME VIEW

import SwiftUI
import FirebaseDatabase

struct EventView: View {
    @State var address = "121,Penarth,Rd,,Bala,Cynwyd,,PA,19004"
    @EnvironmentObject var path : Path
    var event: [String : String]
    @State var logos : [String] = ["Haverford", "Penncrest", "Ridley", "Strath Haven", "Garnet Valley", "Conestoga", "Radnor", "Harriton"]
    var body: some View {
        
        ZStack{
            Image("Background 4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
            VStack {
                HStack(spacing: UIScreen.main.bounds.width/5) {
                    VStack {
                        Image("LMLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height/8)
                            .cornerRadius(4)
                            .padding(.vertical, 5)
                        
                        Text(event["team1"] ?? "?")
                            .font(Constants.GameScoreFont)
                            .foregroundColor(.black)
                            .lineLimit(2)
                            .minimumScaleFactor(0.75)
                    }
                    VStack{
                        
                        Image(event["name"] ?? "Unknown")
                            .resizable()
                            .scaledToFit()
                            .frame(height: UIScreen.main.bounds.height/8)
                            .cornerRadius(4)
                            .padding(.vertical, 5)
                        Text(event["team2"] ?? "?")
                            .font(Constants.GameScoreFont)
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.75)
                        
                    }
                }
            }

            Spacer()
            
            
            VStack {
                HStack {
                    Image(systemName: "calendar")
                Text("Date:   \(event["date"] ?? "04/12/23")")
                    .font(Constants.LargeFont)
                    .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "clock")
                Text("Time:   \(event["time"] ?? "7:00")")
                    .font(Constants.LargeFont)
                    .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "dollarsign.circle")
                    Text("Admission Cost:   \(event["price"] ?? "free") ")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "person.3")
                    Text("Theme:   \(event["theme"] ?? "None")")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location:   \(event["location"] ?? " Lower Merion High School")")
                        .font(Constants.LargeFont)
                        .foregroundColor(.accentColor)
                }
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width/1.2, height: 2)
                    .foregroundColor(.black)
        }
    }
            //            path.remAllPath()
            //            path.addPath(aPath: "schedule")
            //
            //            //GATHERS ALL EVENTS UNDER EACH SPORTS IN SCHEDULE AND SORTS BY DATE
            //            getData.getSortedScheduled(path: path) { sortedEvents in
            //                DispatchQueue.main.async {
            //                    event = sortedEvents
            //                }
            //            }
    }
    }
    
    
    
    
    
    
    // Trying to figure this out currently
    //            TextField("CLICK ME TO DO LOCATION",text:$address)
    //                .foregroundColor(.red)
    //                .multilineTextAlignment(.center)
    //                .padding()
    //
    //            Button {
    //                UIApplication.shared.openURL(NSURL(string: "http://maps.apple.com/?address=\(address.replacingOccurrences(of: " ", with: ","))")! as URL)
    //
    //            } label:{
    //                Text("CLICK ME TO DO LOCATION")
    //            }
    
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: ["":""])
            .environmentObject(Path())
    }
}
