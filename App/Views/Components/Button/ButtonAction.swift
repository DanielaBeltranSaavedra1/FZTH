//
//  ButtonAction.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

public typealias ButtonActionContent = () -> Void

public struct ButtonAction<T:View> {
    public let onClick: ButtonActionContent
    public let destination: T?

    public init(destination: T? = EmptyView() as! T?, onClick: @escaping ButtonActionContent = {}) {
        self.onClick = onClick
        self.destination = destination
    }
    
    public var isDestinationEmpty: Bool {
        return destination is EmptyView
    }
    
    public func getDestination() -> T? {
        return destination
    }
}

public extension ButtonAction where T == EmptyView {
    init(onClick: @escaping ButtonActionContent = {}) {
        self.init(destination: EmptyView(), onClick: onClick)
    }
}
