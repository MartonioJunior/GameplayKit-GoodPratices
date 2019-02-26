//
//  PlayerLogicComponent+Contact.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

extension PlayerLogicComponent: PhysicsContactComponentDelegate {
    func didBeginContact(with other: GameEntity) {
        guard let entity = self.entity as? Player else {
            return
        }
        
        if other is SolidMatter {
            entity.body()?.grounded = true
        }
    }
    
    func didEndContact(with other: GameEntity) {
        guard let entity = self.entity as? Player else {
            return
        }
        
        if other is SolidMatter {
            entity.body()?.grounded = false
        }
    }
    
    func isInContact(with other: GameEntity) {
        
    }
}
