import SwiftUI

struct FirstView: View {
    @Binding var name: String
    @Binding var surName: String
    @State var number = 0
    @State var sheet = false
    @State var titleInfo = ""

    var body: some View {
        VStack {
            Text("Number Counter")
                .font(.title)
            Text(titleInfo)
                .foregroundStyle(.secondary)
            HStack {
                Button(action: {
                    self.number -= 1
                }, label: {
                    Text("-")
                        .font(.largeTitle)
                }).padding()
                
                Text(String(number))
                    .font(.title)
                Button(action: {
                    self.number += 1
                }, label: {
                    Text("+")
                        .font(.largeTitle)
                }).padding()
                
            }
            Button(action: {
                if number > 5 {
                    sheet.toggle()
                } else {
                    self.titleInfo  = "Your number must be greater than 5"
                }
            }, label: {
                Text("Button")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .clipShape(Ellipse())
            }).sheet(isPresented: self.$sheet, content: {
                SecondView(name: $name, surName: $surName, number: $number)
            })
        
        }
    }
}

#Preview {
    FirstView(name: .constant(""), surName: .constant("")) // FirstView'i önizlerken name ve surName parametrelerini geçirin.
}
