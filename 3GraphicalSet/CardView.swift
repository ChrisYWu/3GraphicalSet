//
//  CardView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/15/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBInspectable var number: Int = 0  {
        didSet {
            addSymbols(number)
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    @IBInspectable var color: UIColor = UIColor.lightGray  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shape: Int = 0  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shade: Int = 0 { didSet { setNeedsDisplay(); setNeedsLayout() }}
    @IBInspectable var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout() }}
    
    
    private var strokeWidth: CGFloat = CGFloat(3.0)
    private var symbols = [SingleShapeView]()
    
    private func addSymbols(_ number: Int) {
        for _ in 0 ... number {
            addASymbol()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if symbols.count == 0 {
            addSymbols(number)
        }
        
        for symbol in symbols {
            symbol.frame.size = CGSize(width: 0.2 * bounds.size.width, height: 0.42 * bounds.size.width)
        }
        
        let x = bounds.size.width
        
        switch number {
        case 0:
            let symbol = symbols[0]
            
            symbol.frame.origin = CGPoint(x: 0.5 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
            
        case 1:
            var symbol = symbols[0]
            symbol.frame.origin = CGPoint(x: 0.355 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)

            symbol = symbols[1]
            symbol.frame.origin = CGPoint(x: 0.645 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)

        case 2:
            var symbol = symbols[0]
            symbol.frame.origin = CGPoint(x: 0.23 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
            
            symbol = symbols[1]
            symbol.frame.origin = CGPoint(x: 0.5 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
            
            symbol = symbols[2]
            symbol.frame.origin = CGPoint(x: 0.77 * x, y: 0.3 * x).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)

        default: break
        }
        
    }
    
    func addASymbol() {
        let symbol = SingleShapeView()
        symbol.color = color
        symbol.shape = shape
        symbol.shade = shade
        addSubview(symbol)
        symbols.append(symbol)

        //return symbol
    }

}

extension CardView {
    private struct SizeRatio {
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
    }
    
    private var cornerRadius: CGFloat {
        print ("bounds.size.height = \(bounds.size.height)")
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }

}
