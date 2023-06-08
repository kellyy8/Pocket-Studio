import SwiftUI


struct onboarding_1: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading) {
                    Text("Welcome to a Pocket Studio story.")
                        .bold()
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                        .tracking(1.2)
                    
                    Text("Before you begin, please read below:")
                        .font(.title2)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                        .tracking(1.2)
                        .padding(.bottom, 10)
                    
                    Text("How to use Pocket Studio")
                        .bold()
                        .font(.title3)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                        .tracking(1.2)
                        .padding(.bottom, 0.5)
                    
                    Text("Pocket Studio utilizes an infinite zoom function to tell stories through nested layers of illustration. \n\nTo uncover a layer, zoom into the artwork by simply pushing two fingers outward.")
                        .font(.body)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                    
                    ZStack{
                        Image("background_phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                        
                        Image("holding_phone")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    
                    NavigationLink(destination: onboarding_2().navigationBarBackButtonHidden(true)) {
                        Text("Next")
                            .padding()
                            .background(Color(#colorLiteral(red: 1, green: 0.753333330154419, blue: 0.38333332538604736, alpha: 1)))
                            .foregroundColor(.black)
                            .cornerRadius(14)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 5)
                    Spacer()
                }
                .padding()
                
                VStack{
                    HStack {
                        Spacer()
                        NavigationLink(destination: LandingPageView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "book.fill")
                                .font(.system(size: 30))
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                                .cornerRadius(10)
                        }
                        Spacer()
                        
                        NavigationLink(destination: JournalCover().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 30))
                                .padding()
                                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                                .cornerRadius(10)
                        }
                        Spacer()
                        
                        NavigationLink(destination: settingsView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "gearshape")
                                .font(.system(size: 30))
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
                            .frame(width: 500, height:100)
                    )
                    Spacer()
                }
                .padding(.top, 725)
            }
            .background(
                Image("overlay")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1)
            )
            .background(
                Image("view1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(1)
            )
        }
    }
}

struct onboarding_1_Previews: PreviewProvider {
    static var previews: some View {
        onboarding_1()
    }
}
