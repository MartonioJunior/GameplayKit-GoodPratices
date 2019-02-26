//
//  SKPhysicsHelper.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 06/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import Foundation

class SKPhysicsHelper {
    static func bitMask(layers: [Int]) -> UInt32 {
        var bitMask: UInt32 = 0
        for layer in layers {
            bitMask += UInt32(exactly: powf(2, Float(layer))) ?? 0
        }
        return bitMask
    }
}
