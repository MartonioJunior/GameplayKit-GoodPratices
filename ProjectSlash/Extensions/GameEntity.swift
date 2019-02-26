//
//  GameEntity.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import Foundation
import GameplayKit

class GameEntity: GKEntity {
    func sprite() -> SpriteNodeComponent? {
        return self.component(ofType: SpriteNodeComponent.self)
    }
    
    func position() -> CGPoint? {
        return self.sprite()?.node.position
    }
    
    func body() -> PhysicsComponent? {
        return self.component(ofType: PhysicsComponent.self)
    }
    
    func contactManager() -> PhysicsContactComponent? {
        return self.component(ofType: PhysicsContactComponent.self)
    }
}
