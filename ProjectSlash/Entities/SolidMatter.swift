//
//  SolidMatter.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import UIKit
import GameplayKit

class SolidMatter: GameEntity {
    
    init(x: CGFloat, y: CGFloat, tileWidth: Int, tileHeight: Int) {
        super.init()
        let sprite = SpriteNodeComponent(color: .blue, x: x, y: y, width: gameUnit*tileWidth, height: gameUnit*tileHeight)
        let physicsBody = PhysicsComponent(withComponent: sprite)
        physicsBody.body.isDynamic = false
        physicsBody.body.categoryBitMask = SKPhysicsHelper.bitMask(layers: [1])
        
        self.addComponent(physicsBody)
        self.addComponent(sprite)
        
        self.body()?.jointToSpriteNode()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
