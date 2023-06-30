//
//  LoginView.swift
//  EventLM
//
//  Created by Owen Bress (student LM) on 3/1/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct LoginView: View {
    @Binding var viewState : ViewState
    @EnvironmentObject var userInfo : User
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.brown)
                .opacity(0.15)
                .ignoresSafeArea(.all)
                .frame(width: 500, height: 550)
            
            VStack{
                Image("LMLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(3.0)
                    .offset(y: 0)
                    .padding()
                    .padding()
                
                
                TextField("User name or email", text: $userInfo.username)
                    .font(Constants.textFont)
                    .multilineTextAlignment(.center)
                    .padding()
                
                SecureField("Password", text: $userInfo.password)
                    .font(Constants.textFont)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Button{
                    Auth.auth().signIn(withEmail: userInfo.username, password: userInfo.password){
                        user, error in
                        if let _ = user{
                            print("success")
                            userInfo.loggedIn = true
                            viewState = .home
                        }else{
                            print("failure")
                        }
                    }
                }label:{
                    ZStack{
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width:150,height:50)
                            .foregroundColor(.brown)
                            .ignoresSafeArea()
                            .opacity(0.3)
                        Text("Log In")
                            .font(Constants.buttonFont)
                            .foregroundColor(Color.black)
                    }
                }
                Spacer()
                Button{
                    try! Auth.auth().signOut()
                    userInfo.loggedIn = false
                    viewState = .authentication
                }label:{
                    ZStack{
                        Rectangle()
                            .cornerRadius(30)
                            .frame(width:100,height:50)
                            .foregroundColor(.brown)
                            .ignoresSafeArea()
                            .opacity(0.2)
                        Text("Go Back")
                            .font(Constants.buttonFont)
                            .foregroundColor(Color.brown)
                    }
                }
                .padding()
                

            }
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewState: Binding.constant(ViewState.login))
            .environmentObject(User())
    }
}
