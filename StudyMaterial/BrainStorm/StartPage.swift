import SwiftUI

struct StartPage: View {
    @State private var isAnimating = false
    @State private var navigate = false
    @State private var showNextPage = false
    
    var body: some View {
            ZStack {
                Image("QUIZ1")
                    .resizable()
                    .frame(width: 370, height: 400)
                    .padding()
                    .shadow(radius: 10)
                    .offset(x: -20, y: -100)
                Text("BrainStorm")
                    .font(.system(size: 38, weight: .black))
                    .shadow(color : .yellow , radius: 2)
                    
                    .offset(x: -10, y: -135)
                
                Button {
                    showNextPage = true
                } label: {
                    Text("Start")
                        .font(.system(size: 28, weight: .black))
                        .italic(true)
                        .foregroundColor(.black)
                        .shadow(color : .yellow , radius: 2)
                        .padding()
                        .frame(width: 120, height: 50)
                        .background(Color.white)
                        .opacity(0.9)
                        .scaleEffect(isAnimating ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                        .cornerRadius(6)
                        
                }
                .offset( y: 130)
                
                .fullScreenCover(isPresented: $showNextPage) {
                    QuestionTab()
                }

            }
            .frame(maxWidth : .infinity , maxHeight: .infinity)
            .background(.yellow)
    }
}

struct NextPage: View {
    var body: some View {
        Text("Welcome to the Next Page!")
            .font(.largeTitle)
            .foregroundColor(.blue)
        Button("Go Back") {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}

#Preview {
    StartPage()
}
