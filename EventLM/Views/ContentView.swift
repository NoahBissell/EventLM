//
//  ContentView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/24/23.
//



import SwiftUI

struct ContentView: View {
    @State var viewState: ViewState = .home
    @EnvironmentObject var path : Path
    @EnvironmentObject var isData : getData
    @EnvironmentObject var preferences : Preferences

    var body: some View {
        if viewState == .authentication{
            AuthenticationView(viewState: $viewState)
        }else if viewState == .login{
            LoginView(viewState: $viewState)
        }else if viewState == .signup{
            SignUpView(viewState: $viewState)
        }else{
            TabView{
                
                HomeView(viewState: $viewState)
                    .tabItem{
                        Image(systemName: "star")
                        Text("Home")
                    }
                
                
                ResultsView(viewState: $viewState)
                    .tabItem{
                        Image(systemName: "number.circle")
                        Text("Results")
                    }
                
                
                SettingsView(viewState: $viewState)
                    .tabItem{
                        Image(systemName: "gearshape.2.fill")
                            .foregroundColor(.black)
                        Text("Settings")
                    }
                
            }.accentColor(Color.Maroon)
                
                
                
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Path())
            .environmentObject(getData())
            .environmentObject(Preferences())

    }
}
