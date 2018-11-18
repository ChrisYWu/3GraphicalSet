//
//  OvalView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/14/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable
class OvalView: SymbolView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.addArc(withCenter: CGPoint(x: bounds.maxX/2, y: bounds.maxX/2), radius: bounds.maxX/2, startAngle: CGFloat.pi, endAngle: 0.0, clockwise: true)
        path.addLine(to: CGPoint(x:bounds.maxX, y:3*bounds.maxX/2 ))
        path.addArc(withCenter: CGPoint(x: bounds.maxX/2, y: 3*bounds.maxX/2), radius: bounds.maxX/2, startAngle: 0.0, endAngle: CGFloat.pi, clockwise: true)
        path.close()

        strokeWithPath(path)

    }

}
