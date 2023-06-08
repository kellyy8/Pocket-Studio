    import SwiftUI

    struct settingsView: View {
        @State private var isVoiceoverEnabled = true
        @State private var isSFXEnabled = true

        var body: some View {
            NavigationView{
                ZStack {
                    VStack(alignment: .leading) {
                    Text("Settings")
                            .padding(.bottom, 5)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                        .tracking(1.2)
                        Text("Voiceover")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .tracking(1.2)
                        HStack {
                            Spacer()
                            Toggle("", isOn: $isVoiceoverEnabled)
                                .labelsHidden()
                                .padding(.trailing, 330)
                        }
                        .toggleStyle(DefaultToggleStyle())
                        .tint(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                        
                        Text("Music")
                            .bold()
                            .font(.system(size: 25))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .tracking(1.2)
                
                        HStack {
                            Spacer()
                            Toggle("", isOn: $isSFXEnabled)
                                .labelsHidden()
                                .padding(.trailing, 330)
                                .onChange(of: isSFXEnabled) {
                                    newValue in
                                    if newValue {
                                        playSound(sound: "lofi_music", type: "mp3")
                                    } else {
                                        pauseSound()
                                    }
                                }
                        }
                        .toggleStyle(DefaultToggleStyle())
                        .tint(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))

                        
                        Text("Background Music")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .tracking(1.2)
                        HStack {
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("lofi_girl")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                Text("Lofi Girl")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("classical")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                
                                Text("Classical")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("folk")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                
                                Text("Folk")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                        }
                        .padding(.bottom, 20)
                        
                        Text("Themes")
                            .bold()
                            .font(.system(size: 20))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            .tracking(1.2)
                        HStack {
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("forest")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                
                                Text("Forest")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("beach")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                
                                Text("Beach")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                            Spacer()
                            VStack {
                                Button(action: {
                                    // Button action
                                }) {
                                    Image("sleepover")
                                        .resizable()
                                        .frame(width: 115, height: 115) // Adjust the size as needed
                                }
                                
                                Text("Sleepover")
                                    .font(.system(size: 15))
                                    .bold()
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.88, blue: 0.62, alpha: 1)))
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    
                    VStack{
                        HStack {
                            Spacer()
                            NavigationLink(destination: LandingPageView().navigationBarBackButtonHidden(true)) {
                                Image(systemName: "book")
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
                                Image(systemName: "gearshape.fill")
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
                    .padding(.top, 700)
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
                        .opacity(1)
                )
            }
        }
    }

    struct settingsView_Previews: PreviewProvider {
        static var previews: some View {
            settingsView()
        }
    }

//struct CustomToggleStyle: ToggleStyle {
//    var onColor: Color
//    var offColor: Color
//
//    func makeBody(configuration: Configuration) -> some View {
//        Button(action: { configuration.isOn.toggle() }) {
//            RoundedRectangle(cornerRadius: 10)
//                .fill(configuration.isOn ? onColor : offColor)
//                .frame(width: 50, height: 30)
//        }
//    }
//}
