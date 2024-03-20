//
//  ProductionPlayer.swift
//  visionOS-tutorial
//
//  Created by Hollins, Cecilia on 27/2/2024.
//

import Foundation
import SwiftUI
import AVFoundation

@Observable
class ProductionPlayer: NSObject, AVAudioPlayerDelegate {
    
    var vocalsAudio: AVAudioPlayer!
    var drumsAudio: AVAudioPlayer!
    var bassAudio: AVAudioPlayer!
    var othersAudio: AVAudioPlayer!
    
    var controlButtonIcon = Image(systemName: "play.fill")
    
    var isPlaying: Bool {
        vocalsAudio.isPlaying
    }
    
    func loadSongs(_ fileName: String) {
        let vocalsPath = Bundle.main.path(forResource: "vocals_\(fileName).mp3", ofType: nil)!
        let vocalsUrl = URL(fileURLWithPath: vocalsPath)
        let drumsPath = Bundle.main.path(forResource: "drums_\(fileName).mp3", ofType: nil)!
        let drumsUrl = URL(fileURLWithPath: drumsPath)
        let bassPath = Bundle.main.path(forResource: "bass_\(fileName).mp3", ofType: nil)!
        let bassUrl = URL(fileURLWithPath: bassPath)
        let othersPath = Bundle.main.path(forResource: "others_\(fileName).mp3", ofType: nil)!
        let othersUrl = URL(fileURLWithPath: othersPath)
        

        do {
            vocalsAudio = try AVAudioPlayer(contentsOf: vocalsUrl)
            drumsAudio = try AVAudioPlayer(contentsOf: drumsUrl)
            bassAudio = try AVAudioPlayer(contentsOf: bassUrl)
            othersAudio = try AVAudioPlayer(contentsOf: othersUrl)
            
            vocalsAudio.delegate = self
        } catch {
            print("couldn't load the file")
        }
    }
    
    func play() {
        controlButtonIcon = Image(systemName: "pause.fill")
        vocalsAudio.play()
        drumsAudio.play()
        bassAudio.play()
        othersAudio.play()
        
    }
    
    func pause() {
        controlButtonIcon = Image(systemName: "play.fill")
        vocalsAudio.pause()
        drumsAudio.pause()
        bassAudio.pause()
        othersAudio.pause()
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        pause()
        vocalsAudio.currentTime = 0
        drumsAudio.currentTime = 0
        bassAudio.currentTime = 0
        othersAudio.currentTime = 0
    }
}
