import SwiftUI
import SwiftData

struct Tab2: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User] 
    
    let buttoncolor = LinearGradient(
        gradient: Gradient(colors: [Color.yellow, Color.blue]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    @State var Emailget: String = ""
    @State var Passwordget: String = ""
    @State var message : String = ""
    
    var body: some View {
        Image("pencil")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .overlay(content: {
                Text("Sign Up")
                    .font(.system(size: 35 , weight: .bold))
                    .foregroundColor(.white)
                    .offset(x: 0, y: -225)
            })
            .overlay(
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 350, height: 400)
                        .opacity(0.4)
                        .overlay {
                            HStack {
                                Text("Email")
                                    .font(.system(size: 20 , weight: .bold))
                                    .offset(x: 20, y: -150)
                                    .foregroundColor(.white)
                                
                                Image(systemName: "person")
                                    .foregroundColor(.white)
                                    .offset(x: -30, y: -120)
                                
                                TextField("Enter Your Email", text: $Emailget)
                                    .offset(x: -15, y: -120)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .medium))
                            }
                            .padding(.top, 20)
                            
                            HStack {
                                Image(systemName: "exclamationmark.lock.fill")
                                    .foregroundColor(.white)
                                    .offset(x: -90, y: -50)
                                
                                Text("Password")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .bold()
                                    .offset(x: -120, y: -80)
                                    .overlay(
                                        TextField("Type Your Password", text: $Passwordget)
                                            .foregroundColor(.white)
                                            .accentColor(.red)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(width: 200, height: 50)
                                            .offset(x: -20, y: -50)
                                    )
                            }
                            .padding(.top, 20)
                            
                            HStack {
                                Button {
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
                                } label: {
                                    Text("Login")
                                        .frame(width: 200, height: 30)
                                        .font(.system(size: 20, weight: .medium))
                                        .background(buttoncolor)
                                        .cornerRadius(15)
                                }
                                .offset(x: 0, y: 30)
                                .overlay{
                                    Text("\(message)")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(.white)
                                        .bold()
                                        .offset(y : 70)
                                }
                                
                            }
                        }
                }
            )
    }
}

#Preview {
    Tab2()
}
