import SwiftUI

// Define the Prapor class
class Prapor: ObservableObject {
    @Published var targetNumber: Int
    @Published var userGuess: String = ""
    @Published var feedback: String = ""
    
    init() {
        self.targetNumber = Int.random(in: 1...100)
    }
    
    func checkGuess() {
        if let guess = Int(userGuess) {
            if guess < targetNumber {
                feedback = "Too low!"
            } else if guess > targetNumber {
                feedback = "Too high!"
            } else {
                feedback = "Correct!"
            }
        } else {
            feedback = "Please enter a valid number."
        }
    }
}

struct Guessgame: View {
    @StateObject private var prapor = Prapor()
    
    var body: some View {
        VStack {
            Text("Guess the Number (1-100)")
                .font(.title)
                .padding()
            
            TextField("Enter your guess", text: $prapor.userGuess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Check Guess") {
                prapor.checkGuess()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(prapor.feedback)
                .font(.headline)
                .padding()
        }
        .padding()
    }
}
#Preview {
    Guessgame()
}
