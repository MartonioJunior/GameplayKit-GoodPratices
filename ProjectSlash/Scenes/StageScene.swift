//
//  StageScene.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import SpriteKit
import GameplayKit

class StageScene: SKScene {
    var entities = [GKEntity]()
    var inputSystem = GKComponentSystem(componentClass: GameInputComponent.self)
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -1.8)
        physicsWorld.contactDelegate = self
        
        self.addEntity(entity: Player(x: 0, y: 0))
        self.addEntity(entity: SolidMatter(x: 0, y: -375, tileWidth: 5, tileHeight: 5))
        self.addEntity(entity: SolidMatter(x: 0, y: 375, tileWidth: 5, tileHeight: 5))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(userTap))
        let swipeGestureUp = UISwipeGestureRecognizer(target: self, action: #selector(userSwipeUp))
        swipeGestureUp.direction = .up
        
        view.addGestureRecognizer(tapGesture)
        view.addGestureRecognizer(swipeGestureUp)
    }
    
    func addEntity(entity: GKEntity) {
        entities.append(entity)
        inputSystem.addComponent(foundIn: entity)
        if let node = entity.component(ofType: SpriteNodeComponent.self)?.node {
            self.addChild(node)
        }
    }
    
    @objc func userTap() {
        for component in inputSystem.components {
            if let input = component as? GameInputComponent {
                input.onTap()
            }
        }
    }
    
    @objc func userSwipeUp() {
        for component in inputSystem.components {
            if let input = component as? GameInputComponent {
                input.onSwipe(direction: .up)
            }
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        for entity in entities {
            entity.update(deltaTime: currentTime)
        }
    }
}

extension StageScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity as? GameEntity, let entityB = contact.bodyB.node?.entity as? GameEntity else { return }
        contactBegun(between: entityA, and: entityB)
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        guard let entityA = contact.bodyA.node?.entity as? GameEntity, let entityB = contact.bodyB.node?.entity as? GameEntity else { return }
        contactEnded(between: entityA, and: entityB)
    }
    
    func contactBegun(between entityA: GameEntity, and entityB: GameEntity) {
        entityA.contactManager()?.didBeginContact(with: entityB)
        entityB.contactManager()?.didBeginContact(with: entityA)
    }
    
    func contactEnded(between entityA: GameEntity, and entityB: GameEntity) {
        entityA.contactManager()?.didEndContact(with: entityB)
        entityB.contactManager()?.didEndContact(with: entityA)
    }
}
