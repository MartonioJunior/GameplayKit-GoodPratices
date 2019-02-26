//
//  PlayerLogicComponent+Input.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 25/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import UIKit
import GameplayKit

extension PlayerLogicComponent: GameInputComponentDelegate {
    func onTap() {
        guard let physics = entity?.component(ofType: PhysicsComponent.self) else {
            return
        }
        
        if physics.grounded {
            jump()
        } else if gliding {
            toggleGliding()
        }
    }
    
    func onHold() {
        
    }
    
    func onSwipe(direction: UISwipeGestureRecognizer.Direction) {
        toggleGliding()
    }
    
    func onPan() {
        
    }
}
