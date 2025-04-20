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
    @State var isPointleft : Bool = false
    @State var isPointright : Bool = false
    @State var isOperaterSelected: Bool = false
    @State var leftsite: [String] = []
    @State var rightsite: [String] = []
    @State var DoubleResult: String = "0"
    @State var isAnimation: Bool = false

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
                
                isAnimation.toggle()
                    
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
        isPointleft = leftsite.contains(".")
        isPointright = rightsite.contains(".")

        var leftNumber: Double = 0
        var rightNumber: Double = 0

        if !isPointleft {
            leftNumber = Double(Int(leftsite.joined()) ?? 0)
        } else {
            leftNumber = Double(leftsite.joined()) ?? 0.0
        }

        if !isPointright {
            rightNumber = Double(Int(rightsite.joined()) ?? 0)
        } else {
            rightNumber = Double(rightsite.joined()) ?? 0.0
        }

        switch Operater {
        case "+": DoubleResult = "\(leftNumber + rightNumber)"
        case "-": DoubleResult = "\(leftNumber - rightNumber)"
        case "*": DoubleResult = "\(leftNumber * rightNumber)"
        case "/": DoubleResult = rightNumber != 0 ? "\(leftNumber / rightNumber)" : "0"
        default: DoubleResult = "0"
        }
    }


    func resetCalculator() {
        leftsite.removeAll()
        rightsite.removeAll()
        Operater = ""
        isOperaterSelected = false
        DoubleResult = "0"
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
                            .foregroundStyle(isAnimation ? .red : .purple)
                            .animation(.easeInOut(duration: 1), value: isAnimation)
                            .foregroundColor(Color.red)
                        Text("Result: \(DoubleResult)")
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
