import SwiftUI

struct JournalView: View {
    @State private var newEntry: String = ""
    @State private var entries: [String] = []
    @State private var selectedEntry: String?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
//            Spacer().frame(height: 0)
            
            // TODO: BOLD THE DATES AND ADD enTry BUTTON TEXT.
            
            // TODO: Position date to top right.
            
            // DATE
            RoundedRectangle(cornerRadius: 50)
                .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                .frame(width: 110, height: 20)
                .overlay(
                    Text("June 6th, 2023")
                        .foregroundColor(.white)
                        .font(.custom("Inter Regular", size: 14))
                )
                .offset(x:130, y: 0)
            
            // CLOUD TEXT
            Text("Crying is a healthy and effective way to express your emotions. When was the last time you cried and what made you cry?")
                .font(.custom("Inter Regular", size: 10))
                .tracking(1.4)
                .frame(maxWidth: 220)
                .multilineTextAlignment(.center)
                .offset(x: 0, y: 20)
                
//            Spacer().frame(height: 55)
            
            // TODO: Add mood bar (below cloud text). Make face slidable and divide range of positions into three.
            
            HStack{
                Divider()
                    .frame(width: 100, height: 4)
                    .overlay(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                    .offset(x:148)
                
                Image("neutral")
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .offset(x:40)
            }.offset(y:35)
            
//            Text("JOURNAL")
//                .font(.custom("Inter Regular", size: 14))
//                .tracking(1.4)
            
//            TextField("Enter new entry", text: $newEntry)
//                .padding(.horizontal)
            
            
            // TODO: Add ^ placeholder text and figure out height and width spacing along the screen for text editor.

            // USER ENTERS JOURNAL ENTRY
//            ZStack(alignment: .leading){
                
//                // PLACEHOLDER TEXT: JOURNAL ENTRY
//                if newEntry.isEmpty {
//                    Text("Enter journal entry here.")
//                        .font(.custom("Inter Regular", size: 15))
////                        .offset(x:30)
//                        .opacity(0.4)
//                }
                TextEditor(text: $newEntry)
                    .scrollContentBackground(.hidden)
                    .font(.custom("Inter Regular", size: 19.2))
                //                .frame(width: 200, height: 200)
                    .lineSpacing(8.5)
                    .offset(x:-30, y: -8)
                    .padding(.horizontal, 30)
                    .overlay(
                        Text("Enter journal entry here.")
                            .font(.custom("Inter Regular", size: 15))
                            .opacity(newEntry.isEmpty ? 0.4 : 0),
                        alignment:.topLeading
                    ).offset(x:30, y:38)
                //          .disabled(newEntry.isEmpty)
            
            Button(action: {
                if !newEntry.isEmpty {
                    entries.append(newEntry)
                    newEntry = ""
                }
            }) {
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                    .frame(width: 100, height: 30)
                    .overlay(
                        Text("Add Entry")
                            .foregroundColor(.white)
                            .font(.custom("Inter Regular", size: 15))
//                            .font(.system(size: 30, weight: .heavy))
                    )
                    .offset(x:0, y:20)
            }
            .padding(.horizontal)
            
            //TODO: Display entry after button is tapped. ^
            
//            RoundedRectangle(cornerRadius: 12)
//                .fill(Color(#colorLiteral(red: 0.1, green: 0.1, blue: 0.1, alpha: 1)))
//                .frame(width: 343, height: 633)
//                .overlay(
//                    List(entries, id: \.self) { entry in
//                        Text(entry)
//                    }
//                    .frame(width: 343, height: 633)
//                    .cornerRadius(12)
//                )
            
            // TODO: Move the 'add entry' button down or delete the last line in the background for demo.
//            Spacer()
            
        }
        .padding(.vertical)
//        .background(Color(#colorLiteral(red: 0.9, green: 0.1, blue: 0.1, alpha: 1)))
//        .edgesIgnoringSafeArea(.all)
        .background(
            Image("sample3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
//                .opacity(0.9)
        )
        
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

