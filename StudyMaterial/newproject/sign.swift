//
//  sign.swift
//  StudyMaterial
//
//  Created by IOSTEAM   on 4/11/25.
//

import SwiftUI

struct sign: View {
    @State private var email1 = ""
    @State private var password1 = ""
    @State private var showPassword1 = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(geometry.size.width < 600 ? "moun1" : "moun")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                Text("sign up")
                    .font(.system(size: geometry.size.width < 600 ? 40 : 50 , weight: .black))
                    .offset(y : -170)
                    .foregroundColor(.white)
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.white)
                        TextField("Email", text: $email1)
                            .foregroundColor(.white)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.white)
                        if showPassword1 {
                            TextField("Password", text: $password1)
                        } else {
                            SecureField("Password", text: $password1)
                        }
                        Button(action: {
                            showPassword1.toggle()
                        }) {
                            Image(systemName: showPassword1 ? "eye.slash" : "eye")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    
                    Button(action: {
                    }) {
                        Text("sign in")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .foregroundColor(.blue)
                            .cornerRadius(15)
                            .shadow(radius: 5)
                    }
                    
                }
                .padding()
                .frame(maxWidth: geometry.size.width > 600 ? 400 : .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
                .shadow(radius: 10)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

#Preview {
    sign()
}
