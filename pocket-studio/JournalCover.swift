import SwiftUI

struct JournalCover: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // TODO: Get buttons to take user to first page of journal (JournalPage1).
            // FORWARD BUTTON
            NavigationLink(destination: JournalPage1()
                .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color(#colorLiteral(red: 0.27, green: 0.40, blue: 0.29, alpha: 1)))
                        .frame(width: 50, height: 50)
                        .overlay(Image("forwardArrow").offset(x:-10))
                        .offset(x:200, y:0)
                }
            
            
            // TODO: Add 'NAV BAR' here (last item in VStack).

        }
        
        // TODO: Fix sizing. Images should fill up whole screen.
        // JOURNAL COVER
        .background(
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.1)
        )
        
        // LANDING PAGE BACKGROUND
        .background(
            Image("Landing_Page")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

struct JournalCover_Previews: PreviewProvider {
    static var previews: some View {
        JournalCover()
    }
}

