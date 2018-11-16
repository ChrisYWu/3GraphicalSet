//
//  DiamondView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/14/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable
class DiamondView: SingleShapeView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.maxX/2, y:0.0))
        path.addLine(to: CGPoint(x:bounds.maxX, y:bounds.maxY/2))
        path.addLine(to: CGPoint(x:bounds.maxX/2, y:bounds.maxY))
        path.addLine(to: CGPoint(x:0.0, y:bounds.maxY/2))
        path.close()
        
        strokeWithPath(path)
    }

}
