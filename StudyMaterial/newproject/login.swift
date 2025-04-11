import SwiftUI

struct page1: View {
    @ObservedObject var networkMonitor = NetworkMonitor()
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        if networkMonitor.isConnected {
            GeometryReader { geometry in
                ZStack {
                    Image(geometry.size.width < 600 ? "moun1" : "moun")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                    
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    Text("Login")
                        .font(.system(size: geometry.size.width < 600 ? 40 : 50 , weight: .black))
                        .offset(y : -170)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.white)
                            TextField("Email", text: $email)
                                .foregroundColor(.white)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.white)
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)
                        
                        Button(action: {
                            print("Login tapped")
                        }) {
                            Text("Login")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .foregroundColor(.blue)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        Button("Forgot Password?") {
                            print("Forgot tapped")
                        }
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white.opacity(0.7))
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width > 600 ? 400 : .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        HStack {
                            Text("Sign Up")
                                .font(.system(size: 25 , weight: .bold))
                                .foregroundColor(.white)
                                .padding()
                            Image(systemName: "arrow.right.circle")
                                .foregroundColor(.white)
                                .offset(x : -20)
                                .font(.system(size: 25 , weight: .bold))
                        }
                    }
                    .offset(x: 10, y: 160)
                }
               

            }
        }
        else {
            Image(systemName:"wifi.exclamationmark")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 240, height: 200)
                .scaledToFit()
        }
    }
}

#Preview {
    page1()
}
