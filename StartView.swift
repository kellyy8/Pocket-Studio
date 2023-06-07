import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pocket Studio")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("by creative labs")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                NavigationLink(destination: LandingPageView()
                                .navigationBarBackButtonHidden(true)) {
                    Text("Start")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(25)
                }
                .padding(.top, 50)
            }
            .navigationBarHidden(true)
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
