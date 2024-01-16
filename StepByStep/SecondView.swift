import SwiftUI

struct SecondView: View {
    @Binding var name: String
    @Binding var surName: String
    @Binding var number: Int

    var body: some View {
        VStack {
            Text("Your Name: \(name)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(.blue)
            Text("Your Surname: \(surName)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
                .foregroundStyle(.blue)
            Text("Your Number: \(number)")
                .font(.title)
                .padding()
                .foregroundStyle(.blue)
            
            Button(action: {
                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
            }, label: {
                Text("Button")
            })
            .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.top, 20)
        }
    }
}

#Preview {
    SecondView(name: .constant(""), surName: .constant(""), number: .constant(0))
}
