//
//  GameInputComponentDelegate.swift
//  ProjectSlash
//
//  Created by Martônio Júnior on 25/02/19.
//  Copyright © 2019 ifce. All rights reserved.
//

import UIKit

protocol GameInputComponentDelegate {
    func onTap()
    func onHold()
    func onSwipe(direction: UISwipeGestureRecognizer.Direction)
    func onPan()
}
