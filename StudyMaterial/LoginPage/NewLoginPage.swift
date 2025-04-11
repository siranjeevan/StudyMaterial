import SwiftUI

struct StylishLoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 💜 Background Image (your uploaded one)
                Image("moun") // make sure it's added to Assets.xcassets
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .ignoresSafeArea(.all)

                // 💎 Transparent overlay to increase readability
                Color.black.opacity(0.4)
                    .ignoresSafeArea()

                // Login Form
                VStack(spacing: 30) {
                    Spacer()

                    Image(systemName: "leaf.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.2)
                        .foregroundColor(.white)
                        .shadow(radius: 10)

                    Text("Welcome Back, Machan! 👋")
                        .font(.system(size: geometry.size.width < 600 ? 24 : 36, weight: .bold))
                        .foregroundColor(.white)

                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                                .autocapitalization(.none)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(15)

                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                            if showPassword {
                                TextField("Password", text: $password)
                            } else {
                                SecureField("Password", text: $password)
                            }
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
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
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.7))
                    }
                    .padding()
                    .frame(maxWidth: geometry.size.width > 600 ? 400 : .infinity)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding(.horizontal)

                    Spacer()
                }
                .padding()
            }
        }
    }
}


#Preview {
    StylishLoginView()
}
