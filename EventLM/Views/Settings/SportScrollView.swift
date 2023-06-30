//
//  SportScrollView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/17/23.
//

import SwiftUI

struct SportScrollView: View {
    @EnvironmentObject var path : Path
    @EnvironmentObject var preferences : Preferences

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                
                Rectangle()
                    .foregroundColor(.white.opacity(0.0))
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3), .black.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(18)
                    .frame(width: UIScreen.main.bounds.width*2.365, height: UIScreen.main.bounds.height/20)
                
                LazyHStack(spacing: UIScreen.main.bounds.width / 10) {
                    Text("Soccer")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "soccer")
                            path.lastSport = "soccer"
                            path.change()
                        }
                    Text("Basketball")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "basketball")
                            path.lastSport = "basketball"
                            path.change()

                        }
                    Text("Football")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "football")
                            path.lastSport = "football"
                            path.change()

                        }
                    
                    Text("Lacrosse")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "lacrosse")
                            path.lastSport = "lacrosse"
                            path.change()

                        }
                    Text("Swimming")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "swimming")
                            path.lastSport = "swimming"
                            path.change()

                        }
                    Text("Volleyball")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "volleyball")
                            path.lastSport = "volleyball"
                            path.change()

                        }
                    Text("Wrestling")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "wrestling")
                            path.lastSport = "wrestling"
                            path.change()

                        }
                    Text("Field Hockey")
                        .font(Constants.SportFont)
                        .foregroundColor(.Maroon)
                        .onTapGesture {
                            path.remPath()
                            path.addPath(aPath: "field hockey")
                            path.lastSport = "field hockey"
                            path.change()

                            
                        }
                    
                    
                    
                }
                
            }
            
        }
        
        .frame(height: UIScreen.main.bounds.height/20)
        
        
        
    }
    
    
    
}





struct SportScrollView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SportScrollView()
            .environmentObject(Path())
            .environmentObject(Preferences())
        
    }
    
}
