import Foundation
import SwiftUI
import AVFoundation

class AudioPlayer {
    
    var audioPlayer: AVAudioPlayer!
    
    func playMusic(_ fileName: String) {
        let path = Bundle.main.path(forResource: "\(fileName).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("couldn't load the file")
        }
    }
}
