//
//  AuthenticationView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/1/23.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var viewState : ViewState
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 500, height: 400)
                .ignoresSafeArea()
                .foregroundColor(.Maroon.opacity(0.2))
            VStack(spacing : 40){
                Image("AppLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(3.0)
                    .padding()
                    .padding()
                Text("Aces Athletics")
                
                Button{
                    viewState = .signup
                }label:{
                    ZStack{
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width:150,height:40)
                            .foregroundColor(.Maroon)
                            .ignoresSafeArea()
                            .shadow(color: .black, radius: 20)
                            .opacity(0.3)
                        Text("Sign Up")
                            .font(Constants.SportFont)
                            .foregroundColor(Color.black)
                    }
                }
                
               
                Button{
                    viewState = .login
                }label:{
                    ZStack{
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width:150,height:40)
                            .foregroundColor(.Maroon)
                            .ignoresSafeArea()
                            .opacity(0.3)
                            .shadow(color: .black, radius: 20)
                        Text("Login")
                            .font(Constants.SportFont)
                            .foregroundColor(Color.black)
                    }
                }
                .padding()
            }
            
        }
        .padding()
    }
    
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(viewState: Binding.constant(ViewState.authentication))
    }
}
