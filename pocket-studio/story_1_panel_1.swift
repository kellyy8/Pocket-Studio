//further polish the zoom, landing page, and user profile
//make the appearance of the rabbits slower when they fade into and out the screen***priority
//leaves in the foreground -> look into it
//bunnies position***priority


import SwiftUI

struct Layer {
    var id: Int
    var imageName: String
    var depthEffect: CGFloat
}

struct story_1_panel_1: View {
    @GestureState private var magnification: CGFloat = 1.0
    @GestureState private var dragOffset: CGSize = .zero
    @State private var scale: CGFloat = 1.0
    @State private var position: CGPoint = .zero

    private let minZoom: CGFloat = 1.0
    private let depthEffectBase: CGFloat = 0.1

    private let layers = [
        Layer(id: 0, imageName: "view1", depthEffect: 1.0),
        Layer(id: 1, imageName: "view2", depthEffect: 2.0),
    ]

    private func opacity(layer: Layer) -> Double {
        let adjustedScale = (scale * magnification - CGFloat(layer.depthEffect) + 1)
        let fastFactor: Double = 5.0
        let opacity = min(1.0, max(0.0, Double(adjustedScale) * fastFactor))
        return opacity
    }

    var body: some View {
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
                                }
                                .simultaneously(with: DragGesture()
                                    .updating($dragOffset) { value, state, _ in
                                        state = value.translation
                                    }
                                )
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .onAppear {
                            self.position = CGPoint(x: 375, y: 200)
                        }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct story_1_panel_1_Previews: PreviewProvider {
    static var previews: some View {
        story_1_panel_1()
    }
}
