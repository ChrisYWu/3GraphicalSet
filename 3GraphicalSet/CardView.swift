//
//  CardView.swift
//  3GraphicalSet
//
//  Created by Chris Wu on 11/15/18.
//  Copyright © 2018 Wu Personal Team. All rights reserved.
//

import UIKit

enum CardDisplayState: Int {
    case faceDown = 0
    case chosen = 1
    case matched = 2
    case mismatched = 3
    case suggested = 4
    case onDisplay = 5
}

@IBDesignable class CardView: UIView {
    @IBInspectable var number: Int = -1  {
        didSet {
            addSymbols(number)
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.lightGray  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shape: Int = 0  { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable var shade: Int = 0 { didSet { setNeedsDisplay(); setNeedsLayout() }}
    var displayState: CardDisplayState = .onDisplay { didSet { setNeedsDisplay()}}
    
    private var symbols = [SymbolView]()
    
    private func addSymbols(_ number: Int) {
        for _ in 0 ... number {
            addASymbol()
        }
    }
    
    override func draw(_ rect: CGRect) {
        //This fills the rounded conner cutoff
        let totalArea = UIBezierPath(rect: bounds)
        superview?.backgroundColor?.setFill()
        superview?.backgroundColor?.setStroke()
        totalArea.lineWidth = 1
        totalArea.fill()
        totalArea.stroke()
        
        //This fills the front or back with rounded conners
        let roundedRect = UIBezierPath(roundedRect: bounds.insetBy(dx: paddingWidth*2, dy: paddingHeight*2), cornerRadius: cornerRadius)
        roundedRect.addClip()
        
        if (displayState == .faceDown) {
            UIColor.lightGray.setFill()
        }
        else {
            UIColor.white.setFill()
            
            if (displayState == .onDisplay ) {
                layer.cornerRadius = 0
                layer.borderWidth = 0
            }
            else {
                layer.cornerRadius = cornerRadius
                layer.borderWidth = 5.0
                
                switch displayState {
                case .mismatched: layer.borderColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 0.6946168664)
                case .matched: layer.borderColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 0.7621200771)
                case .suggested: layer.borderColor = #colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 0.71)
                case .chosen: layer.borderColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 0.569536601)
                default: break
                }
            }
        }
        roundedRect.fill()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        ensureSymbols()
        
        if displayState != .faceDown {
            let x = effectiveWidth
            
            switch number {
            case 0:
                let symbol = symbols[0]
                
                symbol.frame.origin = CGPoint(x: 0.5 * x + paddingWidth, y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
            case 1:
                var symbol = symbols[0]
                symbol.frame.origin = CGPoint(x: 0.355 * x + paddingWidth , y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
                symbol = symbols[1]
                symbol.frame.origin = CGPoint(x: 0.645 * x + paddingWidth, y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
            case 2:
                var symbol = symbols[0]
                symbol.frame.origin = CGPoint(x: 0.23 * x + paddingWidth, y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
                symbol = symbols[1]
                symbol.frame.origin = CGPoint(x: 0.5 * x + paddingWidth, y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
                symbol = symbols[2]
                symbol.frame.origin = CGPoint(x: 0.77 * x + paddingWidth, y: 0.3 * x + paddingHeight).offsetBy(dx: -symbol.bounds.width/2, dy: -symbol.bounds.height/2)
                
            default: break
            }
            
        }
        
    }
    
    private func addASymbol() {
        if (displayState != .faceDown) {
            let symbol = SymbolView()
            configSymbol(symbol)
            addSubview(symbol)
            symbols.append(symbol)
        }
    }
    
    private func ensureSymbols() {
        if displayState == .faceDown {
            symbols.removeAll()
        }
        else if symbols.count == 0 {
            addSymbols(number)
        }
        else {
            for s in symbols {
                configSymbol(s)
            }
        }
    }
    
    private func configSymbol(_ symbol: SymbolView) {
        symbol.color = color
        symbol.shape = shape
        symbol.shade = shade
        symbol.frame.size = CGSize(width: 0.2 * effectiveWidth, height: 0.42 * effectiveWidth)
    }

}

extension CardView {
    private struct SizeRatio {
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let padding: CGFloat = 0.00
    }
    
    private var cornerRadius: CGFloat {
        //print ("bounds.size.height = \(bounds.size.height)")
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    
    private var effectiveWidth: CGFloat {
        return bounds.width * (1.0 - SizeRatio.padding)
    }
    
    private var paddingWidth: CGFloat {
        return bounds.width * SizeRatio.padding
    }
    
    private var paddingHeight: CGFloat {
        return bounds.height * SizeRatio.padding
    }
    
    private var effectiveHeight: CGFloat {
        return bounds.height * (1.0 - SizeRatio.padding)
    }

}
