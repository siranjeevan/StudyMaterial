import SwiftUI

struct Calculator: View {
    let calculatorKeys: [String] = [
        "7", "8", "9", "/",
        "4", "5", "6", "*",
        "1", "2", "3", "-",
        "0", ".", "=", "+",
        "(", ")", "C", "AC"
    ]

    @State var Operater = ""
    @State var isOperaterSelected: Bool = false
    @State var leftsite: [String] = []
    @State var rightsite: [String] = []
    @State var result: String = "0" // Stores the calculation result

    func calculateStyle(key: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 50, height: 50)
                .shadow(color: Color.blue, radius: 10)

            Button(action: {
                if key == "+" || key == "-" || key == "*" || key == "/" {
                    self.isOperaterSelected = true
                    self.Operater = key
                } else if key == "=" {
                    calculateResult()
                } else if key == "C" {
                    if isOperaterSelected {
                        rightsite.removeAll()
                    } else {
                        leftsite.removeAll()
                    }
                } else if key == "AC" {
                    resetCalculator()
                } else {
                    if isOperaterSelected {
                        self.rightsite.append(key)
                    } else {
                        self.leftsite.append(key)
                    }
                }
            }) {
                Text(key)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }

    func NumberDisplay() -> String {
        return leftsite.joined() + (Operater.isEmpty ? "" : " \(Operater) ") + rightsite.joined()
    }

    func calculateResult() {
        let leftNumber = Int(leftsite.joined()) ?? 0
        let rightNumber = Int(rightsite.joined()) ?? 0

        switch Operater {
        case "+": result = "\(leftNumber + rightNumber)"
        case "-": result = "\(leftNumber - rightNumber)"
        case "*": result = "\(leftNumber * rightNumber)"
        case "/": result = rightNumber != 0 ? "\(leftNumber / rightNumber)" : "Error"
        default: result = "0"
        }
    }

    func resetCalculator() {
        leftsite.removeAll()
        rightsite.removeAll()
        Operater = ""
        isOperaterSelected = false
        result = "0"
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
                .shadow(color: Color.blue, radius: 10)
                .padding(.bottom, 10)
                .overlay(
                    VStack {
                        Text(NumberDisplay())
                            .font(.title)
                            .foregroundColor(Color.red)
                        Text("Result: \(result)")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                )

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 20) {
                ForEach(calculatorKeys, id: \.self) { k in
                    calculateStyle(key: k)
                }
            }

        }
    }
}

#Preview {
    Calculator()
}
