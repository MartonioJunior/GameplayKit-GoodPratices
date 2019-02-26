//
//  SKPhysicsContactManager.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

extension StageScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("Begin contact!")
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("End contact!")
    }
}
