//
//  ResultsView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/28/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct ResultsView: View {
    @EnvironmentObject var path : Path
    @Binding var viewState : ViewState
    @State private var events: [(id: UUID, key: String, value : AnyObject)] = []
    @EnvironmentObject var preferences : Preferences
    @State var num : Int = 0
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                if events.count != 0{
                    ScrollView{
                        
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 0), spacing: -5),
                            GridItem(.flexible(minimum: 0), spacing: -5)
                            
                        ],spacing:1, content: {
                            ForEach(ManageData.sortArray(array: events, ascending: false), id: \.id) { i in
                                if let event = i.value as? [String: String]{
                                    NavigationLink{
                                        ResultsDetailView(eventData: event)
                                    }label:{
                                        ResultBox(eventData : event)
                                    }
                                }
                                
                            }
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        })
                    }
                    
                }
                else{
                    Text("No results for \(path.lastSport)")
                }
                Spacer()
                SportScrollView()
                    .padding(.bottom)
            }
            .onReceive(path.$pathChanged) { _ in
                if num != 0{
                    events = []
                    //If Boys
                    if preferences.gender.0{
                        //BOYS
                        path.remAllPath()
                        path.addPath(aPath: "results")
                        path.addPath(aPath: "boys")
                        path.addPath(aPath: path.lastSport)
                        //If varsity selected
                        if preferences.level.0{
                            path.addPath(aPath: "varsity")
                            getData.getSortedResults(path: path) { sortedEvents in
                                DispatchQueue.main.async {
                                    events += sortedEvents
                                    
                                    
                                    
                                }
                            }
                            path.remPath()
                        }
                        //if only junior varsity selected
                        if preferences.level.1{
                            path.addPath(aPath: "junior varsity")
                            getData.getSortedResults(path: path) { sortedEvents in
                                DispatchQueue.main.async {
                                    events += sortedEvents
                                    
                                }
                            }
                        }
                        
                    }
                    //If  girls
                    if preferences.gender.1{
                        
                        //BOYS
                        path.remAllPath()
                        path.addPath(aPath: "results")
                        path.addPath(aPath: "girls")
                        path.addPath(aPath: path.lastSport)
                        //If varsity selected
                        if preferences.level.0{
                            path.addPath(aPath: "varsity")
                            getData.getSortedResults(path: path) { sortedEvents in
                                DispatchQueue.main.async {
                                    events += sortedEvents
                                }
                            }
                            path.remPath()
                        }
                        //if only junior varsity selected
                        if preferences.level.1{
                            
                            path.addPath(aPath: "junior varsity")
                            getData.getSortedResults(path: path) { sortedEvents in
                                DispatchQueue.main.async {
                                    events += sortedEvents
                                }
                            }
                        }
                        
                    }
                }
                else{
                    num+=1
                }
            }
            .task{
                events = []
                //If Boys
                if preferences.gender.0{
                    //BOYS
                    path.remAllPath()
                    path.addPath(aPath: "results")
                    path.addPath(aPath: "boys")
                    path.addPath(aPath: path.lastSport)
                    //If varsity selected
                    if preferences.level.0{
                        path.addPath(aPath: "varsity")
                        getData.getSortedResults(path: path) { sortedEvents in
                            DispatchQueue.main.async {
                                events += sortedEvents
                            }
                        }
                    }
                    //if only junior varsity selected
                    if preferences.level.1{
                        path.remPath()
                        path.addPath(aPath: "junior varsity")
                        getData.getSortedResults(path: path) { sortedEvents in
                            DispatchQueue.main.async {
                                events += sortedEvents
                            }
                        }
                    }
                    
                }
                //If  girls
                if preferences.gender.1{
                    
                    //BOYS
                    path.remAllPath()
                    path.addPath(aPath: "results")
                    path.addPath(aPath: "girls")
                    path.addPath(aPath: path.lastSport)
                    //If varsity selected
                    if preferences.level.0{
                        path.addPath(aPath: "varsity")
                        getData.getSortedResults(path: path) { sortedEvents in
                            DispatchQueue.main.async {
                                events += sortedEvents
                            }
                        }
                    }
                    //if only junior varsity selected
                    if preferences.level.1{
                        path.remPath()
                        path.addPath(aPath: "junior varsity")
                        getData.getSortedResults(path: path) { sortedEvents in
                            DispatchQueue.main.async {
                                events += sortedEvents
                            }
                        }
                    }
                    
                }
            }.navigationTitle("Results")
            
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewState: Binding.constant(ViewState.authentication))
            .environmentObject(Path())
            .environmentObject(Preferences())
        
    }
}
