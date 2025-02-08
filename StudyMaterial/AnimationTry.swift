import SwiftUI

struct AnimationTry: View {
    // Gradients for Sun and Moon
    let SunColor = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.75, blue: 0, alpha: 1)),  // Sun-like gold
                                                              Color(#colorLiteral(red: 1, green: 0.9, blue: 0.2, alpha: 1)),  // Bright yellow
                                                              Color(#colorLiteral(red: 1, green: 0.6, blue: 0, alpha: 1))]), // Warm orange
                                   startPoint: .topTrailing,
                                   endPoint: .bottomLeading)
    let MoonColor = LinearGradient(
        gradient: Gradient(colors: [Color.white, Color.gray]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    // State for car animation and day/night toggle
    @State private var carOffset: CGFloat = 300
    @State private var isDay: Bool = true
    
    func dayView() -> some View {
        ZStack {
            Image("road")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(SunColor)
                .shadow(color: .yellow, radius: 10)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: -340)
            
            // Animated Car
            Image("car")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 50)
                .offset(x: 50, y: carOffset)
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: false), value: carOffset)
        }
        .onAppear {
            carOffset = -10 // Start car animation on load
        }
    }
    
    func nightView() -> some View {
        ZStack {
            Image("Night")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(MoonColor)
                .shadow(color: .white, radius: 10)
                .frame(width: 100, height: 100)
                .offset(x: 0, y: -340)
            
            Image("mountain")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .offset(y: 290)
        }
    }
    
    var body: some View {
        ZStack {
            
            Group {
                if isDay {
                    dayView()
                } else {
                    nightView()
                }
            }
            .transition(.opacity)
            .animation(.easeInOut(duration: 1), value: isDay)
            
            VStack {
                Spacer()
                Button(action: {
                    isDay.toggle()
                }) {
                    Text(isDay ? "Switch to Night Mode" : "Switch to Day Mode")
                        .font(.headline)
                        .frame(width: 200, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.bottom, 40)
            }
        }
        
    }
}

#Preview {
    AnimationTry()
}
