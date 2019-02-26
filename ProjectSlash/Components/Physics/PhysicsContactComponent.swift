//
//  PhysicsContactComponent.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

class PhysicsContactComponent: GameComponent {
    var delegate: PhysicsContactComponentDelegate?
    
    func didBeginContact(with other: GameEntity) {
        delegate?.didBeginContact(with: other)
    }
    
    func didEndContact(with other: GameEntity) {
        delegate?.didEndContact(with: other)
    }
    
    func isInContact(with other: GameEntity) {
        delegate?.isInContact(with: other)
    }
}
