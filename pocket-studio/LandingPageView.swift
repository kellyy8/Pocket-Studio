import SwiftUI

struct Story {
    let title: String
    let authors: [String]
    let rating: Double
    let duration: String
    let numberOfStickers: Int
    let coverImageName: String
    let artists: [String]
}

struct LandingPageView: View {
    @State private var username: String
    @State private var stories: [Story] = [
        Story(title: "Hopping\nthrough\nthe Seasons", authors: ["Jocelyn Mendoza"], rating: 4.5, duration: "30min", numberOfStickers: 10, coverImageName: "book_cover", artists: ["Jennie Gao", "Ronald Lu", "Joyce Pang"]),
        Story(title: "Cloud Bunny", authors: [], rating: 4.7, duration: "20min", numberOfStickers: 5, coverImageName: "locked_story", artists: [""])
    ]
    @State private var selectedStoryIndex = 0

    init(username: String = "_____") {
        _username = State(initialValue: username)
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Stories").font(.custom("Aleo Regular", size: 40))
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                    .tracking(4)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 0.13, green: 0.3, blue: 0.21), Color(.sRGB, red: 0.26, green: 0.33, blue: 0.21)]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 220, height: 70) // Adjust the width and height as desired
                            .shadow(color: .black, radius: 20, x: 0, y: 2) // Add shadow with desired properties
                    )
                
                TabView(selection: $selectedStoryIndex) {
                    ForEach(stories.indices, id: \.self) { index in
                        NavigationLink(destination: destinationView(for: stories[index])
                            .navigationBarBackButtonHidden(true)) {
                            ZStack(alignment: .topLeading) {
                                Image(stories[index].coverImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(20)
                                    .frame(width: 650, height: 650)
                                    .shadow(color: .black, radius: 10, x: 2, y: 2) // Add shadow with desired properties
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("\n")
                                    Text(stories[index].title)
                                        .font(.system(size: 24, weight: .bold))
                                        .bold()
                                        .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                        .tracking(2.4)
                                        .padding(.leading, 190)
                                        .fixedSize(horizontal: false, vertical: true)
                                    
                                    Text("Art by")
                                        .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                        .tracking(2.4)
                                        .padding(.leading, 190)
                                        .fixedSize(horizontal: false, vertical: true)

                                    Text(stories[index].artists.joined(separator: "\n"))
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                        .tracking(2.4)
                                        .padding(.leading, 190)
                                        .fixedSize(horizontal: false, vertical: true)

                                    Text("Written by")
                                        .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                        .tracking(2.4)
                                        .padding(.leading, 190)
                                        .fixedSize(horizontal: false, vertical: true)

                                    Text(stories[index].authors.joined(separator: ", "))
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                        .tracking(2.4)
                                        .padding(.leading, 190)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.top, 10)

                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                HStack {
                    Spacer()

                    NavigationLink(destination: LandingPageView()
                        .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "book.fill")
                            .font(.system(size: 30)) // Adjust the size to make the icon bigger
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .cornerRadius(10)
                    }
                    Spacer()

                    NavigationLink(destination: JournalCover()
                        .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 30)) // Adjust the size to make the icon bigger
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

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView()
    }
}

struct StoryView: View {
    var story: Story

    var body: some View {
        Text("Story: \(story.title)")
    }
}
