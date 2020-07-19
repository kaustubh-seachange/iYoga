//
//  TwoSideRoundedTabBar.swift
//  iYoga
//
//  Created by Kaustubh on 23/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

@IBDesignable

class TopSideRoundTabBar: UITabBar {
    private var shapeLayer: CALayer?
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        // 1. Create Path to make Top-Left and Top-Right Curved.
        shapeLayer.path = createPath()
        
        // 2. Work on the Shape Layer which is obtained after from Custom Path.
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 6
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.2

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = self.frame.height
        let width: CGFloat = self.frame.width
        
        let path = UIBezierPath()

        // MARK: 1. start top left, but below height of tab bar.
        path.move(to: CGPoint(x: 0, y: height/2))
        
        path.addCurve(to: CGPoint(x: 25, y: 0),
                      controlPoint1: CGPoint(x: 0, y: 0),
                      controlPoint2: CGPoint(x: 15, y: 0))

        // MARK: 2. Draw Straight Line.
        path.addLine(to: CGPoint(x: width-25, y: 0))

        // MARK: 3. Add another curve.
        path.addCurve(to: CGPoint(x: width, y: height/2),
                      controlPoint1: CGPoint(x: width-15, y: 0),
                      controlPoint2: CGPoint(x: width, y: 0))
        
        // MARK: 4. Finishing touch and closing path.
        path.addLine(to: CGPoint(x: width, y: height))
        
        path.addLine(to: CGPoint(x: 0, y: height))
        
        path.close()

        return path.cgPath
    }
}
