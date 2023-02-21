//
//  Player.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 11/02/23.
//

import AVKit
import SwiftUI
import Combine

struct PlayerView : View{
    let movie: Movie
    @StateObject private var viewModel = AVPlayerViewModel()

    var body: some View{
        NavigationView {
            VStack(alignment: .trailing) {
                NavigationLink(destination:  ContentView().navigationBarHidden(true),isActive: .constant(viewModel.state.goToMainScreen)){}.opacity(0)
                if viewModel.state.showBar{
                    Button(action:{viewModel.state.goToMainScreen = true}){
                        Image(systemName: "multiply")
                    }.buttonStyle(.plain)
                        
                }
                AVVideoPlayer(viewModel: viewModel)
                    .onTapGesture {
                        viewModel.onEvent(event: .videoPressing)
                    }
                if viewModel.state.showBar{
                    HStack {
                        Button(action:{viewModel.onEvent(event: .backward)}){
                            Image(systemName: "backward.circle")
                        }
                        
                        if viewModel.state.isPlay {
                            Button(action:{viewModel.onEvent(event: .pause)}){
                                Image(systemName: "pause.circle")
                            }
                            
                        }else{
                            Button(action:{viewModel.onEvent(event: .play)}){
                                Image(systemName: "play.circle")
                            }
                        }
                        Button(action:{viewModel.onEvent(event: .forward)}){
                            Image(systemName: "forward.circle")
                        }
                    }.padding(.trailing, 700)
                }
            }
            .onAppear {
                viewModel.onEvent(event: .ScreenLoaded(movie: movie, videoURL: "https://storage.googleapis.com/exoplayer-test-media-1/gen-3/screens/dash-vod-single-segment/video-avc-baseline-480.mp4"))
            }
            .onDisappear {
                viewModel.onEvent(event: .pause)
            }
        }
    }
}
