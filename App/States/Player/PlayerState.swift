//
//  PlayerState.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 11/02/23.
//

import AVKit
import Foundation
import SwiftUI
import Combine

public struct PlayerState{
    var pipStatus: PipStatus = .undefined
    var videoURL: String = ""
    var isPlay: Bool = false
    var showBar = false
   var focusable = true
     var goToMainScreen = false
}

enum PipStatus {
    case willStart
    case didStart
    case willStop
    case didStop
    case undefined
}
