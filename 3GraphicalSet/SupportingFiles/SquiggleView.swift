//
//  SquiggleView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/14/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable
class SquiggleView: SymbolView {

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let x = bounds.maxX
        let y = bounds.maxY
        path.move(to: CGPoint(x: 0.103 * x, y: 0.181 * y))
        path.addQuadCurve(to: CGPoint(x:0.135 * x, y: 0.077 * y), controlPoint: CGPoint(x: -0.00 * x, y: 0.128 * y))
        path.addQuadCurve(to: CGPoint(x:0.603 * x, y: 0.060 * y), controlPoint: CGPoint(x: 0.375 * x, y: 0.013 * y))
        path.addQuadCurve(to: CGPoint(x:0.760 * x, y: 0.448 * y), controlPoint: CGPoint(x: 1.05 * x, y: 0.169 * y))
        path.addQuadCurve(to: CGPoint(x:0.903 * x, y: 0.802 * y), controlPoint: CGPoint(x: 0.610 * x, y: 0.620 * y))
        path.addQuadCurve(to: CGPoint(x:0.921 * x, y: 0.903 * y), controlPoint: CGPoint(x: 1.02 * x, y: 0.856 * y))
        path.addQuadCurve(to: CGPoint(x:0.486 * x, y: 0.907 * y), controlPoint: CGPoint(x: 0.779 * x, y: 0.965 * y))
        path.addQuadCurve(to: CGPoint(x:0.203 * x, y: 0.491 * y), controlPoint: CGPoint(x: 0.005 * x, y: 0.791 * y))
        path.addQuadCurve(to: CGPoint(x:0.103 * x, y: 0.181 * y), controlPoint: CGPoint(x: 0.345 * x, y: 0.291 * y))
        
        super.strokeWithPath(path)
    }

}


