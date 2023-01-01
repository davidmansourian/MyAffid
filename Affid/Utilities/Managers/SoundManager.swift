//
//  SoundManager.swift
//  BreathingCircle
//
//  Created by David on 2022-12-02.
//

import Foundation
import AVKit


actor SoundManager{
    static let shared = SoundManager()
    @Published var loading: Bool = false
    var playerLocal: AVAudioPlayer?
    var playerRemote: AVPlayer?
    
    enum SoundOption: String{
        case softgong
    }
    
    func playSound(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
        
        do {
            playerLocal = try AVAudioPlayer(contentsOf: url)
            playerLocal?.play()
        } catch let error {
            print("DEBUG: Couldn't get audio due to \(error.localizedDescription)")
        }
        
    }
    
    func playURLSound(sound: String){
        loading = true
        guard let urlString = URL(string: sound) else {
            loading = false
            return
            
        }
        do {
            self.playerRemote = AVPlayer(playerItem: AVPlayerItem(url: urlString))
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            loading = false
            self.playerRemote?.play()
        } catch let error {
            print("DEBUG: Couldn't get audio due to \(error.localizedDescription)")
            self.loading = false
        }
    }
}

