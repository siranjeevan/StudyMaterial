import SwiftUI

struct Question: View {
    let Question : [String] = [
        "What does CPU stand for?",
        "Which of the following is a programming language?",
        "What is the main function of an operating system?",
        "What does HTTP stand for?",
        "Which data structure uses LIFO (Last In, First Out) principle?"
    ]
    let options :[[String]] = [["A) Central Processing Unit", "B) Computer Processing Unit", "C) Central Program Unit", "D) Central Power Unit"],
    ["A) HTML", "B) Python", "C) HTTP", "D) CSS"],
    ["A) To manage hardware and software resources", "B) To create websites", "C) To perform arithmetic calculations", "D) To design graphics"],
    ["A) Hyper Text Transfer Protocol", "B) High Technology Transmission Protocol", "C) Hyperlink Transfer Process", "D) Hyper Transfer Text Program"],
    ["A) Queue", "B) Stack", "C) Linked List", "D) Array"]
]
    let correctAnswers = [
        "A) Central Processing Unit",
        "B) Python",
        "A) To manage hardware and software resources",
        "A) Hyper Text Transfer Protocol",
        "B) Stack"
    ]
    @State private var isAnimating = false
    @State var questionNumber = 0
    @State var optionIndex = 0
    @State var score = 0
    @State var varifyAnswer = ""
    func style(i : Int ) -> some View {
        Button {
            varifyAnswer = options[optionIndex][i]
            isAnimating.toggle()
            answerVerify()
        } label: {
            Text("\(options[optionIndex][i])")
                .foregroundStyle(varifyAnswer == correctAnswers[questionNumber] ? .green : .red)
                .animation(.easeInOut(duration: 1), value: isAnimating)
                .frame(width: 380, height: 70)
                .background(Color.white)
                .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top , 5)
        }
    }
    func answerVerify() {
        if varifyAnswer == correctAnswers[questionNumber] {
            score += 1
        }
    }
    
    func result() -> some View {
        Text("Score: \(score)/\(Question.count)")
            .font(.title)
            .foregroundStyle(.blue)
    }
    var body: some View {
        Text("Question")
            .font(.title)
            .offset(x: 0, y: -370)
            .padding()
            .foregroundStyle(.blue)
        
        .overlay(
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 380, height: 150)
            .shadow(radius: 10)
            .foregroundColor(.white)
            .offset(x: 0, y: -250)
        )
        .overlay(
            Text("\(Question[questionNumber])")
                .font(.headline)
                .frame(width: 380, height: 150)
                .foregroundColor(.black)
                .bold()
                .offset(x: 0, y: -250)
            )
        
            .overlay(
                VStack
                {
                    if questionNumber < Question.count {
                        Button(action: {
                            questionNumber += 1
                            optionIndex += 1
                            
                        }, label: {
                            Text("Next")
                                .frame(width: 100, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }
                        )
                        .offset(x: 0, y: 350)
                        
                        .overlay(
                            VStack
                            {
                                    ForEach(0..<4) { i in
                                            style(i : i)
                                    }
                            }
                        )
                    }
                    else {
                        result()
                    }
                }
                )
    }
}

#Preview {
    Question()
}
