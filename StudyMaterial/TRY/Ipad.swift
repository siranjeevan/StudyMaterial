import SwiftUI

struct Ipad: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Text("App Name")
                .font(.system(size: width * 0.1, weight: .black))
                .offset(y: height * -0.4)
            
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .frame(width: width * 0.9, height: height * 0.09)
                .opacity(0.3)
                .offset(y: height * 0.40)
            ZStack {
                Button {
                    
                } label: {
                    Image("game")
                        .resizable()
                        .frame(width: width * 0.2, height: height * 0.09)
                }
                .offset(x: width * -0.37)
                
                Button {
                    
                } label: {
                    Image("trate")
                        .frame(width: width * 0.3, height: height * 0.12)

                }
                .offset(x: width * -0.19)
                
                Button {
                    
                } label: {
                            Image("AddMoney")
                                .resizable()
                                .frame(width: width * 0.15, height: height * 0.07)
                }
                Button {
                    
                } label: {
                    Image("Assets")
                        .resizable()
                        .frame(width: width * 0.13, height: height * 0.07)
                }
                .offset(x: width * 0.2)
                Button {
                    
                } label: {
                    Image("shop")
                        .resizable()
                        .frame(width: width * 0.3, height: height * 0.12)
                }
                .offset(x: width * 0.4)
            }
            
            .offset(y: height * 0.40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color.black)
        
    }
}

#Preview {
    Ipad()
}
