import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            StartView()
        } else {
            VStack {
                if colorScheme == .light {
                    lightContent
                } else {
                    darkContent
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    var lightContent: some View {
        VStack {
            Image(systemName: "pencil.circle")
                .font(.system(size: 100))
                .foregroundColor(.black)
            Text("Pocket Studio")
                .font(Font.custom("Baskerville-Bold", size: 24))
                .foregroundColor(.black.opacity(0.80))
            
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1.2)) {
                self.size = 0.9
                self.opacity = 1.00
            }
        }
    }
    
    var darkContent: some View {
        VStack {
            Image(systemName: "pencil.circle")
                .font(.system(size: 100))
                .foregroundColor(.white)
            Text("Pocket Studio")
                .font(Font.custom("Baskerville-Bold", size: 24))
                .foregroundColor(.white.opacity(0.80))
            
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1.2)) {
                self.size = 0.9
                self.opacity = 1.00
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
