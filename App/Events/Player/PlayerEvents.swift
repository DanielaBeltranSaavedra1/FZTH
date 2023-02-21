//
//  PlayerEvents.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 11/02/23.
//

import Foundation

enum PlayerEvents{
    case ScreenLoaded(movie: Movie, videoURL: String)
    case play
    case pause
    case backward
    case forward
    case videoPressing
}
