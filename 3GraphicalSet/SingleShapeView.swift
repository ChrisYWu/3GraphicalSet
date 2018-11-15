//
//  BaseSingleShapeView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/14/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable class SingleShapeView: UIView {
    
    @IBInspectable var color: UIColor = UIColor.lightGray  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var strokeWidth: CGFloat = CGFloat(3.0)  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shape: Int = 0  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shade: Int = 0 { didSet { setNeedsDisplay(); setNeedsLayout() }}
    @IBInspectable var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout() }}

    private static var counter = 0
    override func draw(_ rect: CGRect) {
        SingleShapeView.counter += 1
        print("Redraw \(SingleShapeView.counter)")
        if isFaceUp {
            let path = UIBezierPath()

            outlinePath(path)
            drawWithPath(path)
        }
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
        print("bounds = \(bounds)")
        print(frame)
        print(center)

        switch shape {
        case 0:
            path.addArc(withCenter: CGPoint(x: bounds.maxX/2, y: bounds.maxX/2), radius: bounds.maxX/2, startAngle: CGFloat.pi, endAngle: 0.0, clockwise: true)
            path.addLine(to: CGPoint(x:bounds.maxX, y:3*bounds.maxX/2 ))
            path.addArc(withCenter: CGPoint(x: bounds.maxX/2, y: 3*bounds.maxX/2), radius: bounds.maxX/2, startAngle: 0.0, endAngle: CGFloat.pi, clockwise: true)
            path.close()
        case 1:
            path.move(to: CGPoint(x: bounds.maxX/2, y:0.0))
            path.addLine(to: CGPoint(x:bounds.maxX, y:bounds.maxY/2))
            path.addLine(to: CGPoint(x:bounds.maxX/2, y:bounds.maxY))
            path.addLine(to: CGPoint(x:0.0, y:bounds.maxY/2))
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
            let x = bounds.size.width
            let y = bounds.size.height

            
            for index in 1 ... 32 {
                path1.move(to: CGPoint(x: 0, y: CGFloat(index) * y/32))
                path1.addLine(to: CGPoint(x: x, y: CGFloat(index) * y/32))
                path1.stroke()
            }
            
        default: break
        }
    }

}
