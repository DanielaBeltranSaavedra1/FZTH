//
//  AVVideoPlayer.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 21/02/23.
//

import Foundation
import AVKit
import SwiftUI

struct AVVideoPlayer: UIViewControllerRepresentable {
    @ObservedObject var viewModel: AVPlayerViewModel
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = viewModel.player
        playerViewController.delegate = context.coordinator
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.modalPresentationStyle = .fullScreen
        uiViewController.allowsPictureInPicturePlayback = true
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, AVPlayerViewControllerDelegate {
        let parent: AVVideoPlayer

        
        init(_ parent: AVVideoPlayer) {
            self.parent = parent
        }
        
        func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .willStart
   
        }
        
        func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .didStart
            parent.viewModel.isPlay = true
        }
        
        func playerViewControllerWillStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .willStop
            parent.viewModel.isPlay = false
        }
        
        
        func playerViewControllerDidStopPictureInPicture(_ playerViewController: AVPlayerViewController) {
            parent.viewModel.pipStatus = .didStop
        }
    }
}
