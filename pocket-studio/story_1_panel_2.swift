import SwiftUI

struct story_1_panel_2: View {
    @GestureState private var magnification: CGFloat = 1.0
    @GestureState private var dragOffset: CGSize = .zero
    @State private var scale: CGFloat = 1.0
    @State private var position: CGPoint = .zero
    @State private var switchView: Bool = false
    @State private var chaptersView: Bool = false

    private let minZoom: CGFloat = 1.0
    private let depthEffectBase: CGFloat = 0.1
    private let zoomThreshold: CGFloat = 3.0

    private let layers = [
        Layer(id: 0, imageName: "view3", depthEffect: 1.0),
        Layer(id: 1, imageName: "bunnymiddle", depthEffect: 2.0),
        Layer(id: 2, imageName: "bunnyright", depthEffect: 3.0),
    ]

    private func opacity(layer: Layer) -> Double {
        let adjustedScale = (scale * magnification - CGFloat(layer.depthEffect) + 1)
        let fastFactor: Double = 2.5
        let opacity = min(1.0, max(0.0, Double(adjustedScale) * fastFactor))
        return opacity
    }

    var body: some View {
        ZStack {
            if chaptersView {
                story_1_chapters() // Replace this with your actual View
            } else {
                Group {
                    if switchView {
                        story_1_panel_3()
                    } else {
                        GeometryReader { geometry in
                            ZStack() {
                                ForEach(layers, id: \.id) { layer in
                                    Image(layer.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .offset(x: self.position.x - geometry.size.width / 2,
                                                y: self.position.y - geometry.size.height / 2)
                                        .scaleEffect(max(scale * magnification, minZoom) + depthEffectBase * CGFloat(layer.depthEffect))
                                        .offset(x: geometry.size.width / 2 - self.position.x,
                                                y: geometry.size.height / 2 - self.position.y)
                                        .opacity(opacity(layer: layer))
                                        .gesture(
                                            MagnificationGesture()
                                                .updating($magnification) { value, state, _ in
                                                    state = value
                                                }
                                                .onEnded { value in
                                                    self.scale = max(self.scale * value, self.minZoom)
                                                    if self.scale >= self.zoomThreshold {
                                                        self.switchView = true
                                                    }
                                                }
                                                .simultaneously(with: DragGesture()
                                                    .updating($dragOffset) { value, state, _ in
                                                        state = value.translation
                                                    }
                                                )
                                        )
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                                        .onAppear {
                                            self.position = CGPoint(x: 35, y: geometry.size.height / 2 + 70)
                                        }
                                }
                            }
                        }
                        .edgesIgnoringSafeArea(.all)
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
                }
            }
        }
    }
}

struct story_1_panel_2_Previews: PreviewProvider {
    static var previews: some View {
        story_1_panel_2()
    }
}
