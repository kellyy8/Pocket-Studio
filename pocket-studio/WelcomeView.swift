import SwiftUI

struct WelcomeView: View {
    @State private var username: String
    
    init(username: String = "_____") {
        _username = State(initialValue: username)
    }

    var body: some View {
        VStack {
            Text("Welcome \(username)") // Display the welcome message with the username
                .font(.largeTitle)
                .bold()
                .padding()

            // Start button that navigates to MainView()
            NavigationLink(destination: story_1_panel_1()) {
                Text("Raster Test")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.bottom)

            // New button that navigates to MainViewVector()
            NavigationLink(destination: story_1_panel_1()) {
                Text("Vector Test")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.bottom)

            
            NavigationLink(destination: JournalView()) {
                Text("Journal Test")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.bottom)

            
            NavigationLink(destination: LandingPageView()) {
                Text("Landing Page Test")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(25)
            }
            .padding(.bottom)

            
            // Add any additional views or functionality for the WelcomeView here
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
