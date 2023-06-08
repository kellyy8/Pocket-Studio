import SwiftUI

struct JournalPage2: View {
    @State private var newEntry: String = ""
    @State private var storedEntry: String = ""
    @State private var status: String = "Add Entry"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            VStack {
                // TODO: BOLD THE DATES AND ADD ENTRY BUTTON TEXT.
                
                // DATE
                RoundedRectangle(cornerRadius: 50)
                    .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                    .frame(width: 110, height: 20)
                    .overlay(
                        Text("June 6th, 2023")
                            .foregroundColor(.white)
                            .font(.custom("Inter Regular", size: 14))
                    )
                    .offset(x:120, y: 60)
                
                // STORE OR DISPLAY USER'S ENTRY
                if storedEntry.isEmpty{
                    TextEditor(text: $newEntry)
                        .scrollContentBackground(.hidden)
                        .font(.custom("Inter Regular", size: 19.2))
                        .lineSpacing(8.5)
                        .offset(x:-30, y: -8)
                        .padding(.horizontal, 20)
                        .overlay(
                            Text("Enter journal entry here.")
                                .font(.custom("Inter Regular", size: 15))
                                .opacity(newEntry.isEmpty ? 0.4 : 0),
                            alignment:.topLeading
                        ).offset(x:35, y:75)
                        
                        // Fixed frame size for TextEditor and Text so that other components' positions do not shift when we display the Text instead of TextEditor upon saving user's entry.
                        .frame(width: 395, height: 800)
                }
                else{
                    Text(storedEntry)
                        .frame(width: 395, height: 800, alignment: .topLeading)
                        .offset(x:30, y:75)
                        .font(.custom("Inter Regular", size: 19.2))
                        .lineSpacing(8.5)
                }

                // FOR USER TO STORE ENTRY IF NO ENTRY STORED YET
                Button(action: {
                    if !newEntry.isEmpty {
                        storedEntry = newEntry
                        status = "Entry saved."
                    }
                }) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 100, height: 30)
                        .overlay(
                            Text(status)
                                .foregroundColor(.white)
                                .font(.custom("Inter Regular", size: 15))
                            //                            .font(.system(size: 30, weight: .heavy))
                        )
                        .offset(x:0, y:-50)
                }
                .padding(.horizontal)

                // TODO: Move the 'add entry' button up and remove a line or two from the background so NAV BAR is not covering it.
                
                // TODO: Add 'NAV BAR' here (last item in VStack).
                
            }
            
            // TODO: Get buttons to take user to corresponding page.
            HStack{
                // BACK BUTTON
                NavigationLink(destination: JournalPage1()
                    .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 50, height: 50)
                        .overlay(Image("backArrow").offset(x:10))
                        .offset(x:-170, y:0)
                }
                
                // TODO: Currently takes user to same page. Will remove forward button for last page later on.
                // FORWARD BUTTON
                NavigationLink(destination: JournalPage2()
                    .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 50, height: 50)
                        .overlay(Image("forwardArrow").offset(x:-10))
                        .offset(x:170, y:0)
                }
                
            }.zIndex(1)
        }
        .padding(.vertical)
        .background(
            Image("page2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

struct JournalPage2_Previews: PreviewProvider {
    static var previews: some View {
        JournalPage2()
    }
}
