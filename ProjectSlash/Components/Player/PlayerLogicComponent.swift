//
//  PlayerComponent.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

class PlayerLogicComponent: GameComponent {
    var gliding: Bool = false
    
    override func update(deltaTime: TimeInterval) {
        super.update(deltaTime: deltaTime)
        guard let physics = self.entity?.component(ofType: PhysicsComponent.self) else {
            return
        }
        
        if gliding {
            physics.glide(fallSpeed: 5)
        }
    }
    
    func toggleGliding() {
        gliding = !gliding
    }
    
    func jump() {
        guard let physics = self.entity?.component(ofType: PhysicsComponent.self) else {
            return
        }
        physics.jump(speed: 80)
        physics.grounded = false
    }
}
