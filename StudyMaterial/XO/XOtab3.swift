import SwiftUI



class XOtab3ViewModel: ObservableObject {
    
}


struct XOtab3: View {
    let gradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color.gray]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    @State var boardgrid: [[String]] = Array(repeating: Array(repeating: "-", count: 3), count: 3)
    
    func ButtonShow(i: Int) -> some View {
        HStack {
            ForEach(0..<3, id: \.self) { j in
                Button {
                    
                } label: {
                    Text(boardgrid[i][j])
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.system(size: 40))
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(gradient)
                .frame(maxWidth: .infinity)

            VStack(spacing: 10) {
                ForEach(0..<3, id: \.self) { i in
                    self.ButtonShow(i: i)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    XOtab3()
}
