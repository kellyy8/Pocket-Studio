import SwiftUI

struct JournalCover: View {
    @State private var username: String
    @State private var stories: [Story] = [
        Story(title: "Hopping\nthrough\nthe Seasons", authors: ["Jocelyn Mendoza"], rating: 4.5, duration: "30min", numberOfStickers: 10, coverImageName: "book_cover", artists: ["Jennie Gao", "Ronald Lu", "Joyce Pang"]),
        Story(title: "Cloud Bunny", authors: [], rating: 4.7, duration: "20min", numberOfStickers: 5, coverImageName: "locked_story", artists: [""])
    ]

    init(username: String = "_____") {
        _username = State(initialValue: username)
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: JournalPage1()
                    .navigationBarBackButtonHidden(true)) {
                    ZStack(alignment: .topLeading) {
                        Image("cover")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .frame(width: 650, height: 650) // Adjust the width and height as desired//                            .shadow(color: .black, radius: 10, x: 2, y: 2) // Add shadow with desired properties
                    }
                }
                .buttonStyle(PlainButtonStyle())

                HStack {
                    Spacer()

                    NavigationLink(destination: LandingPageView()
                        .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "book")
                            .font(.system(size: 30)) // Adjust the size to make the icon bigger
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .cornerRadius(10)
                    }
                    Spacer()

                    NavigationLink(destination: JournalCover()
                        .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .font(.system(size: 40)) // Adjust the size to make the icon bigger
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .cornerRadius(10)
                    }
                    Spacer()

                    NavigationLink(destination: settingsView()
                        .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 30)) // Adjust the size to make the icon bigger
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .padding(.top, 25)

                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 0.13, green: 0.3, blue: 0.21), Color(.sRGB, red: 0.26, green: 0.33, blue: 0.21)]), startPoint: .leading, endPoint: .trailing))
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 500, height:100) // Adjust the width and height as desired
                )
            }
            .background(
                Image("overlay")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.1)
            )
            .background(
                Image("Landing_Page")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }

    private func destinationView(for story: Story) -> some View {
        switch story.title {
        case "Hopping\nthrough\nthe Seasons":
            return AnyView(story_1_chapters())
        case "Locked":
            return AnyView(story_1_panel_1())
        default:
            return AnyView(StoryView(story: story))
        }
    }
}

struct JournalCover_Previews: PreviewProvider {
    static var previews: some View {
        JournalCover()
    }
}


