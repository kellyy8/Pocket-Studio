import SwiftUI

struct UserProfileView: View {
    @State private var username: String
    
    init(username: String = "_____") {
        _username = State(initialValue: username)
    }
    var body: some View {
        Text("User Profile for \(username)")
            .font(.largeTitle)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
