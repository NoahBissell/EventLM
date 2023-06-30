//
//  SettingsView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/28/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var viewState : ViewState
    @EnvironmentObject var preferences : Preferences
    
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("Schedule Filters")){
                    Toggle(isOn: $preferences.gender.0,
                           label: {
                        Text("Boys")
                    })
                    
                    Toggle(isOn: $preferences.gender.1,
                           label: {
                        Text("Girls")
                    })
                    
                    Toggle(isOn: $preferences.level.0,
                           label: {
                        Text("Varsity")
                    })
                    
                    Toggle(isOn: $preferences.level.1,
                           label: {
                        Text("Junior Varsity")
                    })
                }
                Section(header: Text("Sports")){
                    Toggle(isOn: $preferences.sports[0],
                           label: {
                        Text("Soccer")
                    }).onChange(of: preferences.sports[0]) { value in
                        preferences.changeSport(name: "soccer")
                    }
                    
                    Toggle(isOn: $preferences.sports[1],
                           label: {
                        Text("Basketball")
                    }).onChange(of: preferences.sports[1]) { value in
                        preferences.changeSport(name: "basketball")
                    }
                    
                    Toggle(isOn: $preferences.sports[2],
                           label: {
                        Text("Football")
                    }).onChange(of: preferences.sports[2]) { value in
                        preferences.changeSport(name: "football")
                    }
                    
                    Toggle(isOn: $preferences.sports[3],
                           label: {
                        Text("Lacrosse")
                    }).onChange(of: preferences.sports[3]) { value in
                        preferences.changeSport(name: "lacrosse")
                    }
                    
                    Toggle(isOn: $preferences.sports[4],
                           label: {
                        Text("Swimming")
                    }).onChange(of: preferences.sports[4]) { value in
                        preferences.changeSport(name: "swimming")
                    }
                    
                    Toggle(isOn: $preferences.sports[5],
                           label: {
                        Text("Volleyball")
                    }).onChange(of: preferences.sports[5]) { value in
                        preferences.changeSport(name: "volleyball")
                    }
                    
                    Toggle(isOn: $preferences.sports[6],
                           label: {
                        Text("Wrestling")
                    }).onChange(of: preferences.sports[6]) { value in
                        preferences.changeSport(name: "wrestling")
                    }
                    
                    Toggle(isOn: $preferences.sports[7],
                           label: {
                        Text("Tennis")
                    }).onChange(of: preferences.sports[7]) { value in
                        preferences.changeSport(name: "tennis")
                    }
                    
                    Toggle(isOn: $preferences.sports[8],
                           label: {
                        Text("Field Hockey")
                    }).onChange(of: preferences.sports[8]) { value in
                        preferences.changeSport(name: "field hockey")
                    }
                    
                }.listRowBackground(Color.gray.opacity(0.2))
                    .toggleStyle(.switch)
                Section(header: Text("Results Filters")){
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Boys")
                    })
                    Toggle(isOn: .constant(true),
                           label: {
                        Text("Girls")
                    })
                }
                
                
                
            }.navigationTitle("Settings")
                .navigationBarItems(leading: Text(""))
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewState: Binding.constant(ViewState.authentication))
            .environmentObject(Preferences())
        
    }
}
