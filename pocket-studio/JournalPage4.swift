import SwiftUI

struct JournalPage4: View {
    @State private var newEntry: String = ""
    @State private var storedEntry: String = ""
    @State private var status: String = "Add Entry"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    
                    HStack{
                        NavigationLink(destination: LandingPageView()
                            .navigationBarBackButtonHidden(true)) {
                            Image(systemName: "book.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                            .offset(x: -110, y: 50)
                            .foregroundColor(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                            .frame(width: 110, height: 20)
                            .overlay(
                                Text("June 7th, 2023")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter Regular", size: 14))
                                    .bold()
                            )
                            .offset(x: 115, y: 50)
                    }

                    
                    // STORE OR DISPLAY USER'S ENTRY
                    if storedEntry.isEmpty{
                        TextEditor(text: $newEntry)
                            .scrollContentBackground(.hidden)
                            .font(.custom("Inter Regular", size: 19.2))
                            .lineSpacing(9.2)
                            .offset(x:-30, y: -8)
                            .padding(.horizontal, 20)
                            .overlay(
                                Text("Enter journal entry here.")
                                    .font(.custom("Inter Regular", size: 15))
                                    .opacity(newEntry.isEmpty ? 0.4 : 0),
                                alignment:.topLeading
                            ).offset(x:35, y:64)
                        
                        // Fixed frame size for TextEditor and Text so that other components' positions do not shift when we display the Text instead of TextEditor upon saving user's entry.
                            .frame(width: 395, height: 800)
                    }
                    else{
                        Text(storedEntry)
                            .frame(width: 395, height: 800, alignment: .topLeading)
                            .offset(x:30, y:64)
                            .font(.custom("Inter Regular", size: 19.2))
                            .lineSpacing(9.2)
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
                    }
                    .padding()
                    .offset(x:0, y:-50)

                }

                HStack {
                       NavigationLink(destination: JournalPage3()
                        .navigationBarBackButtonHidden(true)) {
//                           Image(systemName: "arrow.left")
                            Image("arrow-left")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 50, height: 50)
                               .padding()
                               .offset(x:-26, y:50)
                       }
                    Spacer()
               }
                       .foregroundColor(.black)
                       .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)

            }
            .padding(.vertical)
            .background(
                Image("page4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
            
        }
    }
}

struct JournalPage4_Previews: PreviewProvider {
    static var previews: some View {
        JournalPage4()
    }
}
