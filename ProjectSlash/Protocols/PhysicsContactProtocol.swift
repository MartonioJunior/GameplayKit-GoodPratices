//
//  PhysicsContactProtocol.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 24/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import GameplayKit

protocol PhysicsContactProtocol {
    func didBeginContact(with other: GKEntity)
    func didEndContact(with other: GKEntity)
    //func isInContact(with other: GKEntity)
}
