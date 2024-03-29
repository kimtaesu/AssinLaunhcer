//
//  DMarkView+UIBeizerPath.swift
//  AssinLaunhcer-iOS
//
//  Created by tskim on 17/09/2019.
//  Copyright © 2019 Assin. All rights reserved.
//

import UIKit

extension DMarkView {

    private var canvasSize: CGSize {
        return CGSize(width: 512, height: 512)
    }

    internal func makeRectanglePath() -> UIBezierPath {
        let resizedScale = ResizingScale(bounds: self.bounds.size, canvas: canvasSize)
        let transform = CGAffineTransform(scaleX: resizedScale.x, y: resizedScale.y)
        let rect = CGRect(x: 97.08, y: 97.08, width: 316.95, height: 316.85).applying(transform)
        let path = UIBezierPath(rect: rect)
        UIColor.black.setStroke()
        path.lineWidth = 3
        path.stroke()
        return path
    }
    internal func makeMaskRectanglePath() -> UIBezierPath {
        let resizedScale = ResizingScale(bounds: self.bounds.size, canvas: canvasSize)
        let transform = CGAffineTransform(scaleX: resizedScale.x, y: resizedScale.y)
        let path = UIBezierPath()
        path.move (to: CGPoint(x: 236.84, y: 414.97).applying(transform))
        path.addLine(to: CGPoint(x: 97.08, y: 414.97).applying(transform))
        path.addLine(to: CGPoint(x: 97.08, y: 276.62).applying(transform))
        UIColor.black.setStroke()
        path.lineWidth = 1
        path.miterLimit = 4
        path.stroke()
        return path
    }
    internal func makeDOutlinePath() -> UIBezierPath {
        let resizedScale = ResizingScale(bounds: self.bounds.size, canvas: canvasSize)
        let transform = CGAffineTransform(scaleX: resizedScale.x, y: resizedScale.y)
        let outline = UIBezierPath()
        outline.move (to: CGPoint(x: 191.26, y: 321.9).applying(transform))
        outline.addLine(to: CGPoint(x: 191.26, y: 316.88).applying(transform))
        outline.addLine(to: CGPoint(x: 200.47, y: 311.18).applying(transform))
        outline.addCurve(to: CGPoint (x: 202.14, y: 242.55).applying(transform), controlPoint1: CGPoint(x: 200.47, y: 311.18).applying(transform), controlPoint2: CGPoint (x: 202.36, y: 253.48).applying(transform))
        outline.addCurve(to: CGPoint(x: 200.47, y: 204.1).applying(transform), controlPoint1: CGPoint(x: 201.93, y: 231.61).applying(transform), controlPoint2: CGPoint(x: 201.74, y: 217.04).applying(transform))
        outline.addCurve(to: CGPoint(x: 185.94, y: 196.49).applying(transform), controlPoint1: CGPoint(x: 199.19, y: 191.17).applying(transform), controlPoint2: CGPoint(x: 185.94, y: 196.49).applying(transform))
        outline.addLine(to: CGPoint(x: 185.94, y: 189.55).applying(transform))
        outline.addCurve (to: CGPoint(x: 235.46, y: 189.55).applying(transform), controlPoint1: CGPoint(x: 185.94, y: 189.55).applying(transform), controlPoint2: CGPoint(x: 221.02, y: 190.99).applying(transform))
        outline.addCurve(to: CGPoint (x: 322.57, y: 250.13).applying(transform), controlPoint1: CGPoint(x: 249.91, y: 188.11).applying(transform), controlPoint2: CGPoint(x: 322.34, y: 182.83).applying(transform))
        outline.addCurve(to: CGPoint (x: 251.06, y: 321.9).applying(transform), controlPoint1: CGPoint (x: 322.8, y: 317.43).applying(transform), controlPoint2: CGPoint (x: 265.47, y: 321.92).applying(transform))
        outline.addCurve(to: CGPoint(x: 200.47, y: 321.08).applying(transform), controlPoint1: CGPoint(x: 236.65, y: 321.88).applying(transform), controlPoint2: CGPoint(x: 210.61, y: 319.95).applying(transform))
        outline.addCurve (to: CGPoint (x: 191.26, y: 321.9).applying(transform), controlPoint1: CGPoint(x: 190.33, y: 322.2).applying(transform), controlPoint2: CGPoint (x: 191.26, y: 321.9).applying(transform))
        outline.close()
        UIColor.black.setFill()
        outline.fill ()
        UIColor.black.setStroke()
        outline.lineWidth = 1
        outline.miterLimit = 4
        outline.stroke()
        return outline
    }
    internal func makeDInlinePath() -> UIBezierPath {
        let resizedScale = ResizingScale(bounds: self.bounds.size, canvas: canvasSize)
        let transform = CGAffineTransform(scaleX: resizedScale.x, y: resizedScale.y)
        let dinline = UIBezierPath()

        dinline.move (to: CGPoint (x: 221.17, y: 306.42).applying(transform))
        dinline.addCurve (to: CGPoint (x: 220.13, y: 245.61).applying(transform), controlPoint1: CGPoint (x: 219.53, y: 305.08).applying(transform), controlPoint2: CGPoint(x: 219.75, y: 257.49).applying(transform))
        dinline.addCurve (to: CGPoint(x: 221.17, y: 206).applying(transform), controlPoint1: CGPoint(x: 220.51, y: 233.73).applying(transform), controlPoint2: CGPoint (x: 221.52, y: 206.92).applying(transform))
        dinline.addCurve (to: CGPoint (x: 268.98, y: 207.5).applying(transform), controlPoint1: CGPoint (x: 220.82, y: 205.07).applying(transform), controlPoint2: CGPoint (x: 247.96, y: 201.68).applying(transform))
        dinline.addCurve (to: CGPoint (x: 300.4, y: 240.88).applying(transform), controlPoint1: CGPoint (x: 290.01, y: 213.32).applying(transform), controlPoint2: CGPoint (x: 299.21, y: 230.1).applying(transform))
        dinline.addCurve (to: CGPoint (x: 296.02, y: 281.07).applying(transform), controlPoint1: CGPoint (x: 301.59, y: 251.65).applying(transform), controlPoint2: CGPoint(x: 302.32, y: 266.91).applying(transform))
        dinline.addCurve (to: CGPoint (x: 262.84, y: 306.42).applying(transform), controlPoint1: CGPoint(x: 289.72, y: 295.23).applying(transform), controlPoint2: CGPoint(x: 272.92, y: 304.39).applying(transform))
        dinline.addCurve (to: CGPoint (x: 221.17, y: 306.42).applying(transform), controlPoint1: CGPoint (x: 252.75, y: 308.45).applying(transform), controlPoint2: CGPoint (x: 222.8, y: 307.76).applying(transform))
        dinline.close()
        UIColor.black.setStroke()
        dinline.fill()
        UIColor.black.setStroke()
        dinline.lineWidth = 1
        dinline.miterLimit = 4
        dinline.stroke()
        return dinline
    }
}
