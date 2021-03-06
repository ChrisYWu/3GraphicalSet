//
//  BaseSingleShapeView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/14/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable class SymbolView: UIView {
    
    @IBInspectable var color: UIColor = UIColor.lightGray  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var strokeWidth: CGFloat = CGFloat(1.0)  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shape: Int = 0  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shade: Int = 0 { didSet { setNeedsDisplay(); setNeedsLayout() }}

    private static var counter = 0
    override func draw(_ rect: CGRect) {
        //Draw the white background
        var path = UIBezierPath(rect: bounds)
        UIColor.white.setFill()
        UIColor.white.setStroke()
        path.fill()
        path.stroke()
        
        //Draw the card face
        path = UIBezierPath()
        
        outlinePath(path)
        drawWithPath(path)
    }
    
    func strokeWithPath(_ path: UIBezierPath) {
        color.setStroke()
        path.lineWidth = strokeWidth
        path.stroke()
        
    }
    
    func outlinePath(_ path: UIBezierPath)
    {
        let x = bounds.size.width
        let y = bounds.size.height

        switch shape {
        case 0:
            path.addArc(withCenter: CGPoint(x: x/2, y: x/2), radius: 0.45 * x, startAngle: CGFloat.pi, endAngle: 0.0, clockwise: true)
            path.addLine(to: CGPoint(x: 0.95 * x, y:3*x/2 ))
            path.addArc(withCenter: CGPoint(x: x/2, y: 3*x/2), radius: 0.45 * x, startAngle: 0.0, endAngle: CGFloat.pi, clockwise: true)
            path.close()
        case 1:
            path.move(to: CGPoint(x: x/2, y: 0.03*y))
            path.addLine(to: CGPoint(x: 0.97*x, y:y/2))
            path.addLine(to: CGPoint(x:x/2, y:y*0.97))
            path.addLine(to: CGPoint(x:0.03*x, y:y/2))
            path.close()
        case 2:
            path.move(to: CGPoint(x: 0.103 * x, y: 0.181 * y))
            path.addQuadCurve(to: CGPoint(x:0.135 * x, y: 0.077 * y), controlPoint: CGPoint(x: -0.00 * x, y: 0.128 * y))
            path.addQuadCurve(to: CGPoint(x:0.603 * x, y: 0.060 * y), controlPoint: CGPoint(x: 0.375 * x, y: 0.013 * y))
            path.addQuadCurve(to: CGPoint(x:0.760 * x, y: 0.448 * y), controlPoint: CGPoint(x: 1.05 * x, y: 0.169 * y))
            path.addQuadCurve(to: CGPoint(x:0.903 * x, y: 0.802 * y), controlPoint: CGPoint(x: 0.610 * x, y: 0.620 * y))
            path.addQuadCurve(to: CGPoint(x:0.921 * x, y: 0.903 * y), controlPoint: CGPoint(x: 1.02 * x, y: 0.856 * y))
            path.addQuadCurve(to: CGPoint(x:0.486 * x, y: 0.907 * y), controlPoint: CGPoint(x: 0.779 * x, y: 0.965 * y))
            path.addQuadCurve(to: CGPoint(x:0.203 * x, y: 0.491 * y), controlPoint: CGPoint(x: 0.005 * x, y: 0.791 * y))
            path.addQuadCurve(to: CGPoint(x:0.103 * x, y: 0.181 * y), controlPoint: CGPoint(x: 0.345 * x, y: 0.291 * y))
            
            path.apply(CGAffineTransform(scaleX: 1.02, y: 1.0))
            
        default: break
        }
    }
    
    func drawWithPath(_ path: UIBezierPath)
    {
        switch shade {
        case 0:
            color.setStroke()
            path.lineWidth = strokeWidth
            path.stroke()
        case 1:
            color.setFill()
            path.lineWidth = strokeWidth
            path.fill()
        case 2:
            color.setStroke()
            path.addClip()
            path.lineWidth = strokeWidth
            path.stroke()
            
            let path1 = UIBezierPath()
            path1.lineWidth = 1.0
            let x = Double(bounds.size.width)
            let y = Double(bounds.size.height)
            let stripStep = 5.0
            let step = Int(y/stripStep)
            
            for index in 1 ... step {
                path1.move(to: CGPoint(x: 0, y: Double(index) * stripStep))
                path1.addLine(to: CGPoint(x: x, y: Double(index) * stripStep))
                path1.stroke()
            }
            
        default: break
        }
    }

}
