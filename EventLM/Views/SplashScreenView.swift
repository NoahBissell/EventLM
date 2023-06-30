//
//  ContentView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 2/24/23.
//

import SwiftUI
import Reachability
import Network

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    @State private var isConnected = false
    
    var body: some View {
        if isActive {
            if isConnected{
                ContentView()
            }
            else{
                LoadingView(isConnected: $isConnected)
            }
           
        } else {
            ZStack {
                Image("Background 4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Image("AppLogo")
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration:2)) {
                        self.size = 0.7
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.isActive = true
                    checkConnection()
                }
            }
        }
    }
    
    func checkConnection() {
        let reachability = try! Reachability()

        reachability.whenReachable = { _ in
            DispatchQueue.main.async {
                reachability.stopNotifier()
                self.isConnected = true
            }
        }

        reachability.whenUnreachable = { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.checkConnection()
            }
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

}



struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
