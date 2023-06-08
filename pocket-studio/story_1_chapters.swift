    import SwiftUI

    struct story_1_chapters: View {
        @State private var username: String
        
        init(username: String = "_____") {
            _username = State(initialValue: username)
        }
        
        var body: some View {
            NavigationView {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0.9916666746139526, green: 0.9680554270744324, blue: 0.9131597280502319, alpha: 1)))
                        .frame(width: 368, height: 680)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius:10, x:0, y:4)
                        .overlay(
                            VStack(spacing: 10) {
                                Image("banner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 368, height: 97)
                                    .overlay(
                                            NavigationLink(destination: LandingPageView()
                                                            .navigationBarBackButtonHidden(true)) {
                                                    Image(systemName: "x.circle")
                                                        .bold()
                                                        .foregroundColor(Color.black) 
                                                        .font(.custom("Aleo Bold Italic", size: 25))
                                                        .padding(7)
                                            },
                                            alignment: .topLeading // This will position the "X" at the top left corner
                                        )
                                    .overlay(
                                        VStack {
                                            VStack {
                                                Text("Hopping through the Seasons")
                                                    .font(.custom("Aleo Bold Italic", size: 18))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.27, green: 0.4, blue: 0.29, alpha: 1)))
                                                    .tracking(2.4)
                                                Text("Art by Jennie Gao, Ronald Lu, Joyce Pana")
                                                    .font(.custom("Aleo Bold Italic", size: 10))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.27, green: 0.4, blue: 0.29, alpha: 1)))
                                                    .tracking(2.4)
                                                Text("Written by Jocelyn Mendoza")
                                                    .font(.custom("Aleo Bold Italic", size: 10))
                                                    .foregroundColor(Color(#colorLiteral(red: 0.27, green: 0.4, blue: 0.29, alpha: 1)))
                                                    .tracking(2.4)
                                                    .padding(.leading, 150)
                                            }
                                        }
                                        .padding(), // Adds some padding around the text
                                        alignment: .topLeading // Positions the VStack at the top left corner of the image
                                    )
                                Section {
                                    HStack {
                                        Image(systemName: "info.circle")
                                            .padding(.leading, 15)
                                            .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                            .font(.system(size: 20))
                                        
                                        Text("Story Synopsis")
                                            .font(.system(size: 20, weight: .bold))
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                            .tracking(2.4)
                                            .padding(.leading, 5)
                                            .font(.headline)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    Text("In a mystical forest lives Haru, a bunny with a love so strong for nature that he loses himself through the seasons. Join Haru in his journey through the seasons as he not only makes new discoveries about the world around him, but also about himself.")
                                        .font(.custom("Aleo Bold Italic", size: 12))
                                        .padding(.horizontal)
                                        .fixedSize(horizontal: false, vertical: true)

                                }
                                
                                ChapterButton(chapterName: "START FROM BEGINNING")

                                Section {
                                    HStack {
                                        Image(systemName: "book")
                                            .padding(.leading, 15)
                                            .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                            .font(.system(size: 20))
                                        
                                        Text("Chapters")
                                            .font(.system(size: 20, weight: .bold))
                                            .bold()
                                            .foregroundColor(Color(#colorLiteral(red: 0.14, green: 0.17, blue: 0.21, alpha: 1)))
                                            .tracking(2.4)
                                            .padding(.leading, 5)
                                            .font(.headline)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    VStack(spacing: 10) {
                                        ChapterButton(chapterName: "Chapter 1: Fall")
                                        ChapterButton(chapterName: "Chapter 2: Winter")
                                        ChapterButton(chapterName: "Chapter 3: Spring")
                                        ChapterButton(chapterName: "Chapter 4: Summer")
                                    }
                                }
                            }
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 162, trailing: 10)) // Adjusted padding
                            .foregroundColor(.black)
                        )
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
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 0.13, green: 0.3, blue: 0.21), Color(.sRGB, red: 0.26, green: 0.33, blue: 0.21)]), startPoint: .leading, endPoint: .trailing))
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 500, height:100) // Adjust the width and height as desired
                    )
                }
                .padding(.top, 90) // Adjust this number to shift your view further down
                .background(
                    Image("Landing_Page")
                        .resizable()
                        .aspectRatio(contentMode: .fill) // use .fill to cover the entire area
                        .edgesIgnoringSafeArea(.all) // make sure the image covers the whole screen including edges)
                    )
            }
        }
    }

struct ChapterButton: View {
    var chapterName: String

    var body: some View {
        Group {
            if chapterName == "Chapter 1: Fall" {
                NavigationLink(destination: story_1_panel_1()
                    .navigationBarHidden(true)) {
                    HStack {
                        Image(systemName: "play.square.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.2705882489681244, green: 0.4000000059604645, blue: 0.29411765933036804, alpha: 1)))
                            .font(.system(size: 30)) // Increase the font size to 30
                            .padding()
                        
                        Text(chapterName)
                            .font(.custom("Aleo Bold Italic", size: 18))
                            .foregroundColor(.black)
                            .tracking(2.4)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                }
            } else if chapterName == "Chapter 2: Winter" {
                NavigationLink(destination: story_1_panel_2()
                    .navigationBarHidden(true)) {
                    HStack {
                        Image(systemName: "play.square.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.2705882489681244, green: 0.4000000059604645, blue: 0.29411765933036804, alpha: 1)))
                            .font(.system(size: 30)) // Increase the font size to 30
                            .padding()
                        
                        Text(chapterName)
                            .font(.custom("Aleo Bold Italic", size: 18))
                            .foregroundColor(.black)
                            .tracking(2.4)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                }
            } else if chapterName == "Chapter 3: Spring" {
                NavigationLink(destination: story_1_panel_3()
                    .navigationBarHidden(true)) {
                    HStack {
                        Image(systemName: "play.square.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.2705882489681244, green: 0.4000000059604645, blue: 0.29411765933036804, alpha: 1)))
                            .font(.system(size: 30)) // Increase the font size to 30
                            .padding()
                        
                        Text(chapterName)
                            .font(.custom("Aleo Bold Italic", size: 18))
                            .foregroundColor(.black)
                            .tracking(2.4)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                }
            } else if chapterName == "Chapter 4: Summer" {
                NavigationLink(destination: story_1_panel_3()
                    .navigationBarHidden(true)) {
                        HStack {
                            Image(systemName: "play.square.fill")
                                .foregroundColor(Color(#colorLiteral(red: 0.2705882489681244, green: 0.4000000059604645, blue: 0.29411765933036804, alpha: 1)))
                                .font(.system(size: 30)) // Increase the font size to 30
                                .padding()
                            
                            Text(chapterName)
                                .font(.custom("Aleo Bold Italic", size: 18))
                                .foregroundColor(.black)
                                .tracking(2.4)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                }
            }  else if chapterName == "START FROM BEGINNING" {
                NavigationLink(destination: onboarding_1()
                    .navigationBarHidden(true)) {
                    HStack {
                        Image(systemName: "play.fill")
                            .foregroundColor(.white)
                            .padding()
                        
                        Text(chapterName)
                            .font(.custom("Lexend Regular", size: 14))
                            .foregroundColor(Color(.white))
                            .tracking(1.4)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.2705882489681244, green: 0.4000000059604645, blue: 0.29411765933036804, alpha: 1)))
                    .cornerRadius(10)
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

    struct story_1_chapters_Previews: PreviewProvider {
        static var previews: some View {
            story_1_chapters()
        }
    }
