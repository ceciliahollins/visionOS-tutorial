import Foundation
import SwiftUI
import AVFoundation

@Observable
class AudioPlayer {
    
    private var audioPlayer: AVAudioPlayer!
    
    func loadSong(_ fileName: String) {
        let path = Bundle.main.path(forResource: "\(fileName).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("couldn't load the file")
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
    func pause() {
        audioPlayer.pause()
    }
}
