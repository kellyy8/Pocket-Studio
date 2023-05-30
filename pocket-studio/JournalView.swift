import SwiftUI

struct JournalView: View {
    @State private var newEntry: String = ""
    @State private var entries: [String] = []
    @State private var selectedEntry: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("JOURNAL")
                .font(.custom("Inter Regular", size: 14))
                .tracking(1.4)
            
            TextField("Enter new entry", text: $newEntry)
                .padding(.horizontal)
            
            Button(action: {
                if !newEntry.isEmpty {
                    entries.append(newEntry)
                    newEntry = ""
                }
            }) {
                Text("Add Entry")
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(#colorLiteral(red: 0.8509804010391235, green: 0.8509804010391235, blue: 0.8509804010391235, alpha: 1)))
                .frame(width: 343, height: 633)
                .overlay(
                    List(entries, id: \.self) { entry in
                        Text(entry)
                    }
                    .frame(width: 343, height: 633)
                    .cornerRadius(12)
                )
        }
        .padding(.vertical)
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
