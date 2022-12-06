//
//  SoundManager.swift
//  BreathingCircle
//
//  Created by David on 2022-12-02.
//

import Foundation
import AVKit


class SoundManager{
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String{
        case softgong
    }
    
    func playSound(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("DEBUG: Couldn't get audio due to \(error.localizedDescription)")
        }
        
    }
    
}
