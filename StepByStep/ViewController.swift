import SwiftUI

struct ViewController: View {
    @State private var name = ""
    @State var isNameEmpty = false
    @State var surName = ""
    @State var sheet = false
    @State var info = ""

    var body: some View {
        VStack {
            Text("Contact Form")
                .font(.largeTitle)
                .italic()
                .foregroundStyle(.blue)
                .underline()
                .bold()
                .padding(.bottom,50)
            TextField("Name:", text: $name)
                .font(.title)
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .onChange(of: name) { newValue in
                    isNameEmpty = newValue.trimmingCharacters(in: .whitespaces).isEmpty
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if isNameEmpty {
                Text("Name is required.")
                    .foregroundColor(.red)
            }
              
            TextField("Surname:", text: $surName)
                .font(.title)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .onChange(of: surName) { newValue in
                    isNameEmpty = newValue.trimmingCharacters(in: .whitespaces).isEmpty
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
            if isNameEmpty {
                Text("Surname is required.")
                    .foregroundColor(.red)
            }
            Button(action: {
                if name != "" && surName != "" {
                    sheet.toggle()
                } else {
                    isNameEmpty = name.trimmingCharacters(in: .whitespaces).isEmpty
                }
            }, label: {
                Text("Send")
            }).padding(.top,15)
                .sheet(isPresented: self.$sheet, content: {
                    FirstView(name: $name, surName: $surName)
                })
         }
    }
}

#Preview {
    ViewController()
}
