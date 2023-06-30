//
//  PushData.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/8/23.
//

import SwiftUI
import Foundation
// This should be the view to create a new event. Editing the event should be seperate

// This will be the admin view 
struct PushData: View {
   @StateObject var viewModel = setData()
    @State var sport : String = "Sport"
    @State var date : String = "date"
    @State var time : String = "time"
    @State var location : String = "location"
    @State var price : String = "Price"

    
    var body: some View {
        
        VStack{
            
            TextEditor(text: $sport)
                .padding()
            TextEditor(text: $date)
                .padding()
            TextEditor(text: $time)
                .padding()
            TextEditor(text: $location)
                .padding()
            TextEditor(text: $price)
                .padding()
        
        Button{
            viewModel.setObject(id: sport, date: date, time: time, location: location, price: price)
        }label: {
            Text("Push")
        }
        Spacer()
        }
    }
}

struct PushData_Previews: PreviewProvider {
    static var previews: some View {
        PushData()
    }
}
