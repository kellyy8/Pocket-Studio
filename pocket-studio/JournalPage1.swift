import SwiftUI

struct JournalPage1: View {
    @State private var newEntry: String = ""
    @State private var storedEntry: String = ""
    @State private var status: String = "Add Entry"
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // TODO: BOLD THE DATES AND ADD ENTRY BUTTON TEXT.
                    // DATE
                    HStack{
                        NavigationLink(destination: LandingPageView()
                            .navigationBarBackButtonHidden(true)) {
                            Image(systemName: "book.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                            .offset(x: -110, y: -10)
                            .foregroundColor(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                            .frame(width: 110, height: 20)
                            .overlay(
                                Text("June 6th, 2023")
                                    .foregroundColor(.white)
                                    .font(.custom("Inter Regular", size: 14))
                                    .bold()
                            )
                            .offset(x: 120, y: -10)
                    }
                    
                    // CLOUD TEXT
                    Text("Crying is a healthy and effective way to express your emotions. When was the last time you cried and what made you cry?")
                        .font(.custom("Inter Regular", size: 10))
                        .tracking(1.4)
                        .frame(maxWidth: 250)
                        .multilineTextAlignment(.center)
                        .offset(x: 0, y: 18)
                    
                    // TODO: Dynamic user interaction: Make face slidable and divide range of positions into three.
                    
                    // MOOD SLIDER
                    HStack {
                        Divider()
                            .frame(width: 100, height: 4)
                            .overlay(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                            .offset(x: 148)
                        
                        Image("neutral")
                            .resizable()
                            .frame(width: 32.0, height: 32.0)
                            .offset(x: 40)
                    }.offset(y: 35)
                    
                    // STORE OR DISPLAY USER'S ENTRY
                    if storedEntry.isEmpty {
                        TextEditor(text: $newEntry)
                            .scrollContentBackground(.hidden)
                            .font(.custom("Inter Regular", size: 19.2))
                            .lineSpacing(9)
                            .offset(x: -30, y: -8)
                            .padding(.horizontal, 20)
                            .overlay(
                                Text("Enter journal entry here.")
                                    .font(.custom("Inter Regular", size: 15))
                                    .opacity(newEntry.isEmpty ? 0.4 : 0),
                                alignment: .topLeading
                            ).offset(x: 35, y: 38)
                        // Fixed frame size for TextEditor and Text so that other components' positions do not shift when we display the Text instead of TextEditor upon saving user's entry.
                        .frame(width: 395, height: 570)
                    } else {
                        Text(storedEntry)
                            .frame(width: 395, height: 570, alignment: .topLeading)
                            .offset(x: 30, y: 38)
                            .font(.custom("Inter Regular", size: 19.2))
                            .lineSpacing(9)
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
                            .offset(x: 0, y: 20)
                    }
                    .padding(.horizontal)
                }
                HStack {
                       NavigationLink(destination: JournalCover()
                        .navigationBarBackButtonHidden(true)) {
                           Image(systemName: "arrow.left")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 25, height: 25)
                               .padding()
                       }
                       Spacer()
                       NavigationLink(destination: JournalPage2()
                        .navigationBarBackButtonHidden(true)) {
                           Image(systemName: "arrow.right")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 25, height: 25)
                               .padding()
                       }
               }
                       .foregroundColor(.black)
                       .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            }
            .padding(.vertical)
            .background(
                Image("page1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true) // Hide the navigation bar
        }
    }
}

struct JournalPage1_Previews: PreviewProvider {
    static var previews: some View {
        JournalPage1()
    }
}
