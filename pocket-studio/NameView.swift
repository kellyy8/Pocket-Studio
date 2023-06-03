import SwiftUI

struct NameView: View {
    @State private var username = ""
    @State private var showingLoginScreen = false

    private let usernameKey = "username" // Key to save and load the username from UserDefaults

    init() {
        if let storedUsername = UserDefaults.standard.string(forKey: usernameKey) {
            _username = State(initialValue: storedUsername)
        }
    }

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)

            VStack
            {
                Text("Type in name:")
                    .font(.largeTitle)
                    .bold()
                    .padding()

                TextField("Name", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                NavigationLink(destination: WelcomeView(username: username)) {
                    Text("Start")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(25)
                }
                .padding(.top, 10)
                .onChange(of: username) { newValue in // Save the username when it changes
                    UserDefaults.standard.set(newValue, forKey: usernameKey)
                }
            }
        }.navigationBarHidden(true)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}
