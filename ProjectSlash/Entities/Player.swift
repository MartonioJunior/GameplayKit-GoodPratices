//
//  Player.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import UIKit
import GameplayKit

class Player: GameEntity {
    
    init(x: CGFloat, y: CGFloat) {
        super.init()
        let sprite = SpriteNodeComponent(image: #imageLiteral(resourceName: "player_idle"), x: x, y: y)
        let physicsBody = PhysicsComponent(withComponent: sprite)
        physicsBody.body.collisionBitMask = SKPhysicsHelper.bitMask(layers: [1])
        physicsBody.body.contactTestBitMask = SKPhysicsHelper.bitMask(layers: [1])
        let playerComponent = PlayerLogicComponent()
        let inputController = GameInputComponent()
        inputController.delegate = playerComponent
        let contactComponent = PhysicsContactComponent()
        contactComponent.delegate = playerComponent
        
        self.addComponent(physicsBody)
        self.addComponent(sprite)
        self.addComponent(inputController)
        self.addComponent(playerComponent)
        self.addComponent(contactComponent)
        
        self.body()?.jointToSpriteNode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
