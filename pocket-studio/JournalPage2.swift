import SwiftUI

struct JournalPage2: View {
    @State private var newEntry: String = ""
    @State private var entries: [String] = []
    @State private var selectedEntry: String?
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
                    .offset(x:120, y: -10)
                
                // FOR USER TO INPUT JOURNAL ENTRY
                TextEditor(text: $newEntry)
                    .scrollContentBackground(.hidden)
                    .font(.custom("Inter Regular", size: 19.2))
                    .lineSpacing(8.5)
                    .offset(x:-30, y: -8)
                    .padding(.horizontal, 30)
                    .overlay(
                        Text("Continue journal entry here.")
                            .font(.custom("Inter Regular", size: 15))
                            .opacity(newEntry.isEmpty ? 0.4 : 0),
                        alignment:.topLeading
                    ).offset(x:30, y:8)
                
                // FOR USER TO STORE ENTRY
                //TODO: Display $newEntry string after button is tapped.
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


// OLD CODE FOR BACK AND FORWARD BUTTONS
//Button(action: {
//    // TODO: UPDATE FUNCTIONALITY
//    if !newEntry.isEmpty {
//        entries.append(newEntry)
//        newEntry = ""
//    }
//}) {
//    RoundedRectangle(cornerRadius: 50)
//        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
//        .frame(width: 50, height: 50)
//        .overlay(
//            Image("backArrow").offset(x:8)
////                            Text("<")
////                                .foregroundColor(.white)
////                                .font(.custom("Inter Regular", size: 20))
////                                .offset(x: 10)
//            //  .font(.system(size: 30, weight: .heavy))
//        )
//        .offset(x:-150, y:0)
//}
//.padding(.horizontal)
//
//Button(action: {
//    // TODO: UPDATE FUNCTIONALITY
//    if !newEntry.isEmpty {
//        entries.append(newEntry)
//        newEntry = ""
//    }
//}) {
//    RoundedRectangle(cornerRadius: 50)
//        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
//        .frame(width: 50, height: 50)
//        .overlay(
//            Image("forwardArrow").offset(x:-8)
////                            Text(">")
////                                .foregroundColor(.white)
////                                .font(.custom("Inter Regular", size: 20))
////                                .offset(x: -10)
//            //  .font(.system(size: 30, weight: .heavy))
//        )
//        .offset(x:150, y:0)
//}
