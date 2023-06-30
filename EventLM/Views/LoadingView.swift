//
//  LoadingView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 4/19/23.
//

import SwiftUI

struct LoadingView: View {
    @Binding var isConnected: Bool
    
    var body: some View {
        ZStack{
            Image("Background 4")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ProgressView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingView(isConnected: Binding.constant(false))
    }
    
}
