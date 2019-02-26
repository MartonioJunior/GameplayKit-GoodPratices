//
//  SpriteNodeComponent.swift
//  ProjectSlash
//
//  Created by ifce on 19/09/18.
//  Copyright © 2018 ifce. All rights reserved.
//

import UIKit
import GameplayKit

let gameUnit: Int = 64

class SpriteNodeComponent: GKSKNodeComponent {
    var sprite: SKSpriteNode? {
        get {
            guard let node = self.node as? SKSpriteNode else {
                return nil
            }
            return node
        }
    }
    
    init(image: UIImage, x: CGFloat, y: CGFloat, width: Int = gameUnit, height: Int = gameUnit) {
        super.init()
        let texture = SKTexture(image: image)
        self.node = SKSpriteNode(texture: texture, size: CGSize(width: width, height: height))
        self.node.position = CGPoint(x: x, y: y)
    }
    
    init(color: UIColor, x: CGFloat, y: CGFloat, width: Int = gameUnit, height: Int = gameUnit) {
        super.init()
        self.node = SKSpriteNode(color: color, size: CGSize(width: width, height: height))
        self.node.position = CGPoint(x: x, y: y)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
