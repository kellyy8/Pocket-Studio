import SwiftUI
import Foundation
import AVFoundation

@main
struct SplashScreenApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .onAppear(){
                    playSound(sound: "lofi_music", type: "mp3")
                }
            }
        }
    }

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func pauseSound() {
    audioPlayer?.pause()
}
