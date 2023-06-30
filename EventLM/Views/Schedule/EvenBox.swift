//
//  EvenBox.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/23/23.
//

import SwiftUI

struct EvenBox: View {
    
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.accentColor.opacity(0.2))
                .cornerRadius(30)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/6)
            HStack{
                Image("LMLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(4)
                    .padding(.vertical, 5)
                
                VStack(alignment: .leading, spacing: 5){
                    Text("")
                        .font(Constants.GameScoreFont)
                        .lineLimit(2)
                        .minimumScaleFactor(0.75)
                    
                    Text("")
                        .font(Constants.MediumFont)
                        .foregroundColor(.secondary)
                }
            }
            
            
            
            
        }
        
        
        
    }
}

struct EvenBox_Previews: PreviewProvider {
    static var previews: some View {
        EvenBox()
    }
}
