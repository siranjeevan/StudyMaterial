import SwiftUI

struct FloatingActionButton: View {
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
//            if isExpanded {
//                Color.black.opacity(0.3)
//                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        withAnimation {
//                            isExpanded.toggle()
//                        }
//                    }
//            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if isExpanded {
                        VStack(spacing: 12) {
                            FloatingButton(icon: "heart.fill", color: .red) {
                                print("Heart tapped")
                            }
                            FloatingButton(icon: "star.fill", color: .yellow) {
                                print("Star tapped")
                            }
                            FloatingButton(icon: "trash.fill", color: .gray) {
                                print("Trash tapped")
                            }
                        }
                        .transition(.scale)
                    }
                    
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(systemName: isExpanded ? "xmark" : "plus")
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding()
                }
            }
        }
    }
}

struct FloatingButton: View {
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .frame(width: 50, height: 50)
                .background(color)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }
}

struct ContentView: View {
    var body: some View {
        FloatingActionButton()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
