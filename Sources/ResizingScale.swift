//
//  ResizingScale.swift
//  AssinLaunhcer-iOS
//
//  Created by tskim on 17/09/2019.
//  Copyright © 2019 Assin. All rights reserved.
//

import UIKit

struct ResizingScale {
    let scales: CGPoint
    
    public init(bounds: CGSize, canvas: CGSize) {
        var scale = CGPoint()
        scale.x = bounds.width / canvas.width
        scale.y = bounds.height / canvas.height
        self.scales = scale
    }
}

extension ResizingScale {
    var x: CGFloat {
        return scales.x
    }
    var y: CGFloat {
        return scales.y
    }
}
public enum ResizingBehavior: Int {
    case resize

    public func apply(bounds: CGSize, target: CGRect, canvas: CGSize) -> CGRect {
        if bounds == canvas {
            return CGRect(origin: .zero, size: bounds)
        }

        var scales: CGPoint = .zero
        scales.x = bounds.width / canvas.width
        scales.y = bounds.height / canvas.height

        var result = CGRect()

        switch self {
        case .resize:
            result.origin.x = max(target.origin.x * scales.x, 0)
            result.origin.y = max(target.origin.y * scales.y, 0)
            result.size.width = max(target.width * scales.x, 0)
            result.size.height = max(target.height * scales.y, 0)
        }
        return result
    }
    public func point(bounds: CGSize, target: CGPoint, canvas: CGSize) -> CGPoint {
        if bounds == canvas {
            return target
        }

        var scales: CGPoint = .zero
        scales.x = bounds.width / canvas.width
        scales.y = bounds.height / canvas.height

        var result = CGPoint()

        switch self {
        case .resize:
            result.x = max(target.x * scales.x, 0)
            result.y = max(target.y * scales.y, 0)
        }
        return result
    }
}
