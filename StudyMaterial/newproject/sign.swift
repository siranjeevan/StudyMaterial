//
//  sign.swift
//  StudyMaterial
//
//  Created by IOSTEAM   on 4/11/25.
//

import SwiftUI
import SwiftData

struct sign: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]
    
    @State private var Emailget = ""
    @State private var Passwordget = ""
    @State private var showPassword1 = false
    @State private var message : String?
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("IPhone")
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
                        TextField("Email", text: $Emailget)
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
                            TextField("Password", text: $Passwordget)
                        } else {
                            SecureField("Password", text: $Passwordget)
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
                        guard !Emailget.isEmpty, !Passwordget.isEmpty else {
                            message = "Please fill all fields"
                            return
                        }

                        if users.contains(where: { $0.email.lowercased() == Emailget.lowercased() }) {
                            message = "Email already exists!"
                            return
                        }

                        let user = User(email: Emailget, password: Passwordget)
                        context.insert(user)
                        Emailget = ""
                        Passwordget = ""
                        message = "Signup successful!"
                    }) {
                        Text("sign in")
                            .fontWeight(.black)
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
                .background(Color.white.opacity(0.3))
                .cornerRadius(25)
                .shadow(radius: 10)
                .padding(.horizontal)
                Spacer()
                    .overlay {
                        Text(message ?? "")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .offset(y : 140)
                        
                    }
            }
        }
    }
}

#Preview {
    sign()
}
