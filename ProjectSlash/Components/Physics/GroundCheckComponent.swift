//
//  GroundCheckComponent.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

// -- NOT USED --
class GroundCheckComponent: GameComponent {
    var body: SKPhysicsBody
    var grounded: Bool = false
    
    init(withRadius radius: CGFloat = 5) {
        body = SKPhysicsBody(circleOfRadius: radius)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
