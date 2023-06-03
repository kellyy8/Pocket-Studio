//just story title 1
//talk to UI/UX about the landing page
//click the story would give an overview of the chapters
//settings page instead of profile view
import SwiftUI

struct Story {
    let title: String
    let author: String
    let rating: Double
    let duration: String
    let numberOfStickers: Int
}

struct LandingPageView: View {
    @State private var username: String
    @State private var stories: [Story] = [
        Story(title: "Story Title 1", author: "Author 1", rating: 4.5, duration: "30min", numberOfStickers: 10),
        Story(title: "Locked", author: "Author 2", rating: 4.7, duration: "20min", numberOfStickers: 5),
        Story(title: "Locked", author: "Author 3", rating: 4.2, duration: "45min", numberOfStickers: 8)
    ]

    init(username: String = "_____") {
        _username = State(initialValue: username)
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Recommended Stories")
                    .font(.custom("Inter Bold", size: 24))

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(stories, id: \.title) { story in
                            VStack(alignment: .leading) {
                                NavigationLink(destination: destinationView(for: story)) {
                                    RoundedRectangle(cornerRadius: 25)
                                        .fill(Color(#colorLiteral(red: 0.5541666746139526, green: 0.5541666746139526, blue: 0.5541666746139526, alpha: 1)))
                                        .frame(width: 248, height: 379)
                                }.buttonStyle(PlainButtonStyle())

                                VStack(alignment: .leading, spacing: 4) {
                                    Text(story.title)
                                        .font(.headline)
                                    Text("Author: \(story.author)")
                                        .font(.subheadline)
                                    Text("Rating: \(story.rating)")
                                        .font(.subheadline)
                                    Text("Duration: \(story.duration)")
                                        .font(.subheadline)
                                    Text("Stickers: \(story.numberOfStickers)")
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                    .padding()
                }

                HStack {
                    NavigationLink(destination: JournalView()) {
                        Image(systemName: "book")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    NavigationLink(destination: UserProfileView(username: username)) {
                        Image(systemName: "person")
                            .padding()
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Landing Page")
        }
    }

    private func destinationView(for story: Story) -> some View {
        switch story.title {
        case "Story Title 1":
            return AnyView(story_1_panel_1())
        case "Story Title 2":
            return AnyView(story_1_panel_1())
        // add more cases as needed
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


// remember to add the views for other stories here
