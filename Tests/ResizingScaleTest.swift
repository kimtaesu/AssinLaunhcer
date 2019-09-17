//
//  ResizingScaleTest.swift
//  AssinLaunhcer-iOS
//
//  Created by tskim on 17/09/2019.
//  Copyright © 2019 Assin. All rights reserved.
//

import Foundation
import XCTest
@testable import AssinLauncher

class ResizingScaleTest: XCTestCase {
    func testScales() {
        let scale = ResizingScale(bounds: CGSize(width: 250, height: 250), canvas: CGSize(width: 512, height: 512))
        XCTAssertEqual(scale.scales, CGPoint(x: 0.48828125, y: 0.48828125))
    }
}

