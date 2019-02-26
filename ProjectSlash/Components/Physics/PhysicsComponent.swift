//
//  PhysicsComponent.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import GameplayKit

class PhysicsComponent: GameComponent {
    var body: SKPhysicsBody
    var grounded: Bool = true
    
    init(withRadius radius: CGFloat) {
        body = SKPhysicsBody(circleOfRadius: radius)
        super.init()
    }
    
    init(withComponent component: SpriteNodeComponent) {
        body = SKPhysicsBody(rectangleOf: component.sprite?.size ?? CGSize.zero, center: component.node.position)
        super.init()
    }
    
    func jointToSpriteNode() {
        self.entity?.component(ofType: SpriteNodeComponent.self)?.node.physicsBody = self.body
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime: TimeInterval) {
        
    }
}

// --MARK:Player Actions
extension PhysicsComponent {
    func move(speed: CGFloat) {
        self.body.velocity.dy = speed
    }
    
    func jump(speed: CGFloat) {
        self.body.applyImpulse(CGVector(dx: 0, dy: speed))
    }
    
    func glide(fallSpeed: CGFloat) {
        if self.body.velocity.dy < -fallSpeed {
            self.body.velocity.dy = -fallSpeed
        }
    }
}
