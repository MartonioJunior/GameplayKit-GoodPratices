//
//  GameInputComponent.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

class GameInputComponent: GameComponent {
    var delegate: GameInputComponentDelegate?
    func onTap() {
        delegate?.onTap()
    }
    
    func onHold() {
        delegate?.onHold()
    }
    
    func onSwipe(direction: UISwipeGestureRecognizer.Direction) {
        delegate?.onSwipe(direction: direction)
    }
    
    func onPan() {
        delegate?.onPan()
    }
}
