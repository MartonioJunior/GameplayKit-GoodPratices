//
//  PhysicsContactComponentDelegate.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 25/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

protocol PhysicsContactComponentDelegate {
    func didBeginContact(with other: GameEntity)
    func didEndContact(with other: GameEntity)
    func isInContact(with other: GameEntity)
}
