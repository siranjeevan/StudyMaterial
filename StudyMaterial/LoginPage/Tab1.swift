//
//  Navigation.swift
//  StudyMaterial
//
//  Created by Jeevith  on 01/02/25.
//

import SwiftUI

struct Tab1: View {
    @State var email = ""
    @State var password = ""
    let buttoncolor = LinearGradient(
        gradient: Gradient(colors: [Color.yellow, Color.blue]),
        startPoint: .leading,
        endPoint: .trailing
    )
    var body: some View {
        VStack {
            NavigationView {
                Image("pencil")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            RoundedRectangle(cornerRadius: 20 )
                                .fill(Color.white)
                                .frame(width: 350, height: 600)
                                .opacity(0.4)
                            
                        }
                    )
                    .overlay(
                        VStack {
                            Text("Login")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                                .offset(x: 0, y: -260)
                            HStack
                            {
                                Image(systemName: "person")
                                    .foregroundColor(.white)
                                    .offset(x: -110, y: -180)
                                Text("Email")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(x: -150, y: -220)
                                    .overlay(
                                        TextField("Type Your Email" ,text: $email )
                                            .foregroundColor(.white)
                                            .accentColor(.red)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(width: 200, height: 50 )
                                            .offset(x: -20, y: -180)
                                    )
                            }
                            HStack
                            {
                                Image(systemName: "exclamationmark.lock.fill")
                                    .foregroundColor(.white)
                                    .offset(x: -90, y: -120)
                                Text("Password")
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(x: -130, y: -160)
                                    .overlay(
                                        TextField("Type Your Password" ,text: $password )
                                            .foregroundColor(.white)
                                            .accentColor(.red)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(width: 200, height: 50 )
                                            .offset(x: -20, y: -120)
                                    )
                            }
                            HStack
                            {
                                Button {
                                    
                                } label: {
                                    Text("Forgot Password?")
                                        .foregroundColor(Color.white)
                                }
                                .offset(x : 90, y : -80)
                            }
                            HStack
                            {
                                Button {
                                    
                                } label: {
                                    Text("Login")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .frame(width: 300, height: 30)
                                        .background(buttoncolor)
                                        .cornerRadius(15)
                                }
                                .offset(x : 0, y : -60)
                            }
                            VStack
                            {
                                Text("or sign up using")
                                    .foregroundColor(.white)
                                    .offset(x : 0, y : 150)
                                NavigationLink("Sign Up", destination: Tab2())
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.blue)
                                    .offset(x : 0, y : 160)
                            }
                        }
                    )
            }
        }
    }
}

#Preview {
    Tab1()
}
