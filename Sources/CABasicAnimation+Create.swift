//
//  CABasicAnimation+Create.swift
//  Example
//
//  Created by tskim on 17/09/2019.
//  Copyright © 2019 Assin. All rights reserved.
//
import UIKit

extension CABasicAnimation {
    static func createAnimationLayer(
        withDuration duration: TimeInterval,
        delay: TimeInterval,
        animationKeyPath: String,
        timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut),
        fromValue from: Any?,
        toValue to: Any?
        ) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: animationKeyPath)
        animation.beginTime = CACurrentMediaTime() + delay
        animation.fromValue = from
        animation.toValue = to
        animation.timingFunction = timingFunction
        animation.isRemovedOnCompletion = false
        animation.duration = duration
        animation.fillMode = .forwards
        return animation
    }
}
