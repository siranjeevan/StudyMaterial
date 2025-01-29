


import SwiftUI

struct Calculator: View {
    let calculatorKeys: [String] = [
        "7", "8", "9", "/",
        "4", "5", "6", "*",
        "1", "2", "3", "-",
        "0", ".", "=", "+",
        "(", ")", "C", "AC"
    ]
    @State var action = ""
    @State var Number = 0
    @State var leftsite : [String] = []
    @State var rightsite : [String] = []
    @State private var isAnimating = false
    func calculateStyle(key: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 50, height: 50)
                .shadow(color: Color.blue, radius: 10)

            Button(action: {
                isAnimating.toggle()
                self.action = key
                self.leftsite.append(contentsOf: ["\(key)"])
            }) {
                Text(key)
                    .foregroundStyle(isAnimating ? .red : .purple)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
        }
    }
    func NumberJoin() -> Int
    {
        self.Number = Int(leftsite.joined()) ?? 0
        return self.Number
    }

    var body: some View {
        VStack {
            Text("Calculator")
                .font(.title)
                .foregroundColor(Color.red)
                .bold()
                .padding(.top, 20)

            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 380, height: 100)
                .shadow(radius: 10)
                .padding(.bottom, 10)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 20) {
                ForEach(calculatorKeys, id: \.self) { k in
                    calculateStyle(key: k)
                }
                
            }
            .overlay(
                Text("\(NumberJoin())")
                    .frame(width: 380, height: 80)
                    .font(.title)
                    .offset(x : 0, y: -230)
                    .foregroundColor(Color.red)
                )
            
        }
    }
}

#Preview {
    Calculator()
}
