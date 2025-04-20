import SwiftUI

// MARK: - Conversion Logic
func convertNumber(_ input: Int, fromBase convert1: Int, toBase convert2: Int) -> String {
    var number = input
    var base10 = 0
    var power = 1
    var result: [String] = []

    if convert1 != 10 {
        while number != 0 {
            let digit = number % 10
            base10 += digit * power
            power *= convert1
            number /= 10
        }
    } else {
        base10 = number
    }

    if convert2 != 10 {
        var temp = base10
        while temp > 0 {
            let remainder = temp % convert2
            if remainder >= 10 {
                result.append(String(UnicodeScalar(55 + remainder)!)) // 10 -> A, 11 -> B
            } else {
                result.append(String(remainder))
            }
            temp /= convert2
        }
        return result.reversed().joined()
    } else {
        return "\(base10)"
    }
}

struct BASE_CONVERTION_PAGE: View {
    @State var input: String = ""
    @State private var option1 = ""
    @State private var option2 = ""
    @State private var output = "0"
    @State private var showOptions1 = false
    @State private var showOptions2 = false

    let options = ["2(Binary)", "8(Octal)", "10(Decimal)", "16(Hexadecimal)"]

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 187/255, green: 134/255, blue: 252/255), // Electric Purple
                    Color(red: 250/255, green: 245/255, blue: 233/255)  // Ivory
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Base Converter")
                    .font(.system(size: 35, weight: .black))
                    .shadow(radius: 10)
                    .foregroundColor(Color(red: 18/255, green: 18/255, blue: 18/255))
                    .padding(.top, 60)

                VStack(alignment: .leading, spacing: 20) {
                    // Number Input
                    TextField("Enter Number", text: $input)
                        .padding()
                        .font(.system(size: 20, weight: .black))
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    
                    // From Base
                    HStack {
                        TextField("Base From", text: $option1)
                            .padding()
                            .fontWeight(.black)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onTapGesture {
                                withAnimation {
                                    showOptions1.toggle()
                                    showOptions2 = false
                                }
                            }
                        
                        if showOptions1 {
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(options.filter {
                                    $0.lowercased().contains(option1.lowercased()) || option1.isEmpty
                                }, id: \.self) { option in
                                    Text(option)
                                        .padding()
                                        .fontWeight(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            option1 = option
                                            showOptions1 = false
                                        }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                            .padding(.top, 5)
                        }
                    }
                    .padding(.horizontal)
                    
                    // To Base
                    HStack {
                        TextField("To Base", text: $option2)
                            .padding()
                            .fontWeight(.black)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .onTapGesture {
                                withAnimation {
                                    showOptions2.toggle()
                                    showOptions1 = false
                                }
                            }
                        
                        if showOptions2 {
                            VStack(alignment: .leading, spacing: 5) {
                                ForEach(options.filter {
                                    $0.lowercased().contains(option2.lowercased()) || option2.isEmpty
                                }, id: \.self) { option in
                                    Text(option)
                                        .padding()
                                        .fontWeight(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .onTapGesture {
                                            option2 = option
                                            showOptions2 = false
                                        }
                                }
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                            .padding(.top, 5)
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    // Buttons
                    HStack {
                        Button {
                            guard let num = Int(input),
                                  let fromBase = Int(option1.components(separatedBy: "(").first ?? ""),
                                  let toBase = Int(option2.components(separatedBy: "(").first ?? "") else {
                                output = "Invalid input"
                                return
                            }
                            output = convertNumber(num, fromBase: fromBase, toBase: toBase)
                        } label: {
                            HStack {
                                Text("Convert")
                                Image(systemName: "arrowshape.up.circle.fill")
                            }
                            .font(.system(size: 20, weight: .black))
                        }
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .offset(x : 10)
                        
                        Button {
                            input = ""
                            option1 = ""
                            option2 = ""
                            output = "0"
                        } label: {
                            HStack {
                                Text("Reset")
                                Image(systemName: "arrow.trianglehead.counterclockwise.rotate.90")
                            }
                            .font(.system(size: 20, weight: .black))
                        }
                        .foregroundColor(.black)
                        .frame(width: 150, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .offset(x : 50)
                    }
                    .padding(.horizontal)
                    
                    // Result Output
                    Text("Result : \( output )")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.black)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                        .padding(.horizontal , 40)
                }
                .frame(width: 380, height: 430)
                .background(.ultraThinMaterial)
                .cornerRadius(25)
                .shadow(radius: 10)
                Spacer()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    BASE_CONVERTION_PAGE()
}
