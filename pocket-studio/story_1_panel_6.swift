import SwiftUI

struct story_1_panel_6: View {
    @State private var switchView: Bool = false
    @State private var chaptersView: Bool = false

    private let layers = [
        Layer(id: 0, imageName: "bunnyriver", depthEffect: 1.0),
    ]

    var body: some View {
        ZStack {
            if chaptersView {
                story_1_chapters() // Replace this with your actual View
            } else {
                Group {
                    if switchView {
                        AnyView(story_1_panel_7())
                    } else {
                        AnyView(
                            GeometryReader { geometry in
                                ZStack() {
                                    ForEach(layers, id: \.id) { layer in
                                        Image(layer.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                    }
                                }
                            }
                            .edgesIgnoringSafeArea(.all)
                        )
                    }
                }
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.chaptersView = true
                        }) {
                            Image(systemName: "ellipsis")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }
                    Spacer()
                    Button(action: {
                        self.switchView = true
                    }) {
                        Text("Next")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(40)
                    }
                    .padding([.leading, .trailing], 20)
                }
            }
        }
    }
}

struct story_1_panel_6_Previews: PreviewProvider {
    static var previews: some View {
        story_1_panel_6()
    }
}
