//
//  DMarkView.swift
//  AssinLaunhcer-iOS
//
//  Created by tskim on 17/09/2019.
//  Copyright © 2019 Assin. All rights reserved.
//

import UIKit

final public class DMarkView: UIView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .white
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        drawDMark()
    }
}

extension DMarkView {
    private func drawDMark() {
        // [Unknown process name] CGContextRestoreGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
        if let _ = UIGraphicsGetCurrentContext() {
            let lineWidth = self.bounds.width / 100
            let rectangle = CAShapeLayer()
            rectangle.path = makeRectanglePath().cgPath
            rectangle.lineWidth = lineWidth
            rectangle.strokeEnd = 0
            rectangle.fillColor = UIColor.clear.cgColor
            rectangle.strokeColor = UIColor.black.cgColor
            rectangle.name = "rectangle"
            self.layer.addSublayer(rectangle)

            let weight: CGFloat = 5
            let maskRectangle = CAShapeLayer()
            maskRectangle.path = makeMaskRectanglePath().cgPath
            maskRectangle.lineWidth = lineWidth * weight
            maskRectangle.strokeEnd = 0
            maskRectangle.fillColor = UIColor.clear.cgColor
            maskRectangle.strokeColor = UIColor.white.cgColor
            maskRectangle.name = "rectangle.mask"
            self.layer.addSublayer(maskRectangle)

            let DOutline = CAShapeLayer()
            DOutline.path = makeDOutlinePath().cgPath
            DOutline.lineWidth = lineWidth
            DOutline.strokeEnd = 0
            DOutline.fillColor = UIColor.clear.cgColor
            DOutline.strokeColor = UIColor.black.cgColor
            DOutline.name = "d.outline"
            self.layer.addSublayer(DOutline)

            let DInline = CAShapeLayer()
            DInline.path = makeDInlinePath().cgPath
            DInline.lineWidth = lineWidth
            DInline.strokeStart = 0
            DInline.strokeEnd = 0
            DInline.fillColor = UIColor.white.cgColor
            DInline.strokeColor = UIColor.black.cgColor
            DInline.name = "d.inline"
            self.layer.addSublayer(DInline)
            UIGraphicsEndImageContext()
        }
    }

    func startAnimation(_ block: @escaping (() -> Void)) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(block)
        self.layer.first(name: "rectangle") {
            $0.removeAllAnimations()
            let animationLayer = CABasicAnimation.createAnimationLayer(
                withDuration: 0.5,
                delay: 0,
                animationKeyPath: "strokeEnd",
                fromValue: 0.0,
                toValue: 1.0)
            $0.add(animationLayer, forKey: "rectangle.strokeEnd")
        }
        self.layer.first(name: "rectangle.mask") {
            $0.removeAllAnimations()
            let animationLayer = CABasicAnimation.createAnimationLayer(
                withDuration: 0.3,
                delay: 1.3,
                animationKeyPath: "strokeEnd",
                fromValue: 0.0,
                toValue: 1.0)
            $0.add(animationLayer, forKey: "rectangle.mask.strokeEnd")
        }
        self.layer.first(name: "d.outline") {
            $0.removeAllAnimations()
            let animationLayer = CABasicAnimation.createAnimationLayer(
                withDuration: 1,
                delay: 0.36,
                animationKeyPath: "strokeEnd",
                fromValue: 0.0,
                toValue: 1.0)
            $0.add(animationLayer, forKey: "d.outline.strokeEnd")
            let fillColorAnimationLayer = CABasicAnimation.createAnimationLayer(
                withDuration: 0.3,
                delay: 1.3,
                animationKeyPath: "fillColor",
                timingFunction: CAMediaTimingFunction.init(controlPoints: 0.55, 0.055, 0.675, 0.19),
                fromValue: UIColor.clear.cgColor,
                toValue: UIColor.black.cgColor)
            $0.add(fillColorAnimationLayer, forKey: "d.outline.fillColor")
        }
        self.layer.first(name: "d.inline") {
            $0.removeAllAnimations()
            let animationLayer = CABasicAnimation.createAnimationLayer(
                withDuration: 0.68,
                delay: 0.68,
                animationKeyPath: "strokeEnd",
                fromValue: 0.0,
                toValue: 1.0)
            $0.add(animationLayer, forKey: "d.inline.strokeEnd")
        }
        CATransaction.commit()
    }
}

private extension CALayer {
    @discardableResult
    func first(name: String, action: ((CALayer) -> Void)? = nil) -> CALayer? {
        let layer = self.sublayers?.first {
            $0.name == name
        }

        if let layer = layer {
            action?(layer)
        }
        return layer
    }
}
