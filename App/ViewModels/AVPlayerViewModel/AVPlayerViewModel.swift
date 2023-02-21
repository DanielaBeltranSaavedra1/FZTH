//
//  AVPlayerViewModel.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 21/02/23.
//

import Foundation
import Combine
import SwiftUI
import AVKit

final class AVPlayerViewModel: ObservableObject {
    @Published var state: PlayerState
    
    let player = AVPlayer()
    private var cancellable: AnyCancellable?
    
    init() {
        self.state = PlayerState()
        setAudioSessionCategory(to: .playback)
        cancellable = $state
         .compactMap({ $0 })
         .compactMap({ URL(string: $0.videoURL) })
         .sink(receiveValue: { [weak self] in
         guard let self = self else { return }
         self.player.replaceCurrentItem(with: AVPlayerItem(url: $0))
         })
    }
    
    func onEvent(event: PlayerEvents){
        switch(event){
        case .ScreenLoaded(movie: _, videoURL: let videoURL):
            state.videoURL = videoURL
        case .play:
            play()
        case .pause:
            pause()
        case .backward:
            backward()
        case .forward:
            forward()
        case .videoPressing:
            state.showBar.toggle()
            state.focusable.toggle()
        }
    }
    
    private func play() {
        state.isPlay = true
        state.showBar.toggle()
        state.focusable.toggle()
        player.play()
    }
    
    private  func pause() {
        state.isPlay = false
        state.showBar.toggle()
        state.focusable.toggle()
        player.pause()
    }
    private  func backward() {
        let time = player.currentTime() - CMTime(seconds: Double(10), preferredTimescale: 1)
        state.showBar.toggle()
        state.focusable.toggle()
        player.seek(to: time)
    }
    private func forward() {
        let time = player.currentTime() + CMTime(seconds: Double(10), preferredTimescale: 1)
        state.showBar.toggle()
        state.focusable.toggle()
        player.seek(to: time)
    }
    func setAudioSessionCategory(to value: AVAudioSession.Category) {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(value)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
}
