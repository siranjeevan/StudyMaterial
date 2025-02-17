import SwiftUI

struct QuestionGametab1: View {
    let Question : [String] = [
        "What does CPU stand for?",
        "Which of the following is a programming language?",
        "What is the main function of an operating system?",
        "What does HTTP stand for?",
        "Which data structure uses LIFO (Last In, First Out) principle?"
    ]
    let options :[[String]] = [ ["A) Central Processing Unit", "B) Computer Processing Unit", "C) Central Program Unit", "D) Central Power Unit"],
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
    @State var answerStore :[String] = []
    
    @State private var questionNumber = 0
    @State private var score = 0
    @State private var selectedAnswer: String? = nil
    @State private var isAnswered = false
    @State var isCheck : Bool = false
    @State private var optionIndex : Int = 0
    @State var a : Int = 0
    @State var Isback : Bool = false
    
    func checkAnswer() {
        if selectedAnswer == correctAnswers[questionNumber] {
            score += 1
        }
        isAnswered = true
    }
    
    func getButtonColor(for option: String) -> Color {
        if isAnswered {
            if option == correctAnswers[questionNumber]{
                return .green
            } else if option == selectedAnswer {
                return .red
            }
        }
        return .white
    }
    
    func Selectanswer(for option: String) -> Color {
        if isAnswered {
            if option == answerStore[questionNumber]{
                return .green
            }
            else if option == selectedAnswer {
                return .red
            }
        }
        return .white
    }
    
    var body: some View {
        VStack
        {
            Text("Questions")
                .font(.largeTitle)
                .bold()
                .background(LinearGradient(gradient: Gradient(colors: [.black, .red]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .offset(x: 0, y: -350)
                .overlay {
                        HStack {
                            Text("\(questionNumber + 1).\(Question[questionNumber])")
                                .foregroundColor(.white)
                                .frame(width: 350, height: 150)
                                .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .trailing))
                            
                                .bold()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .offset(x : 0 , y : -240)
                        }
                    VStack {
                        ForEach(0..<options[questionNumber].count, id: \.self) { i in
                            Button{
                                if !isAnswered {
                                    isCheck = true
                                    selectedAnswer = options[questionNumber][i]
                                    optionIndex = i
                                }
                            }label: {
                                Text("\(options[questionNumber][i])")
                                    .frame(width: 350, height: 60)
                                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .top, endPoint: .bottom))
                                    .foregroundColor(a == 0 ? getButtonColor(for: options[questionNumber][i]) : Selectanswer(for: answerStore[questionNumber]))
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                                    .padding(.top, 5)
                            }
                            .disabled(isAnswered)
                            .disabled(Isback)
                            .offset(x : 0 , y : 55)
                        }
                        
                        VStack
                        {
                            Button {
                                checkAnswer()
                                answerStore.append(options[questionNumber][optionIndex])
                                print(answerStore)
                                
                            } label: {
                                Text("Check")
                                    .frame(width: 100, height: 40)
                                    .bold()
                                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .bottom, endPoint: .topTrailing))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                            }
                            .disabled(!isCheck)
                            .offset(x : 0 , y : 90)
                            
                            Button {
                                if questionNumber > 0
                                {
                                    questionNumber -= 1
                                    selectedAnswer = nil
                                    Isback = true
                                    a = 1
                                }
                            } label: {
                                Text("Back")
                                    .frame(width: 100, height: 40)
                                    .bold()
                                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .bottom, endPoint: .topTrailing))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                            }
                            .disabled(questionNumber == 0)
                            .offset(x : -120 , y : 43)


                        }
                        
                        if questionNumber < Question.count {
                            Button {
                                if questionNumber < Question.count - 1
                                {
                                    questionNumber += 1
                                    selectedAnswer = nil
                                    isAnswered = false
                                    isCheck = false
                                    
                                }
                            } label:{
                                Text("Next")
                                    .frame(width: 100, height: 40)
                                    .bold()
                                    .background(LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .bottom, endPoint: .topTrailing))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                            }
                            .disabled(!isAnswered)
                            .offset(x : 120 , y : -5)
                        }
                    }
                }
        }
        .frame(maxWidth : .infinity , maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    QuestionGametab1()
}
