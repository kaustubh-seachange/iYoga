//
//  TwoSideRoundedTabBar.swift
//  iYoga
//
//  Created by Kaustubh on 23/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

@IBDesignable

class BottomSideRoundView: UIView {
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

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        path.addLine(to: CGPoint(x: width,
                                 y: height-30))
        path.addCurve(to: CGPoint(x: width-30, y: height),
                      controlPoint1: CGPoint(x: width, y: height-30),
                      controlPoint2: CGPoint(x: width, y: height))
        
        path.addLine(to: CGPoint(x: 0+30, y: height))

        path.addCurve(to: CGPoint(x: 0, y: height-30),
                      controlPoint1: CGPoint(x: 0+30, y:height),
                      controlPoint2: CGPoint(x: 0, y: height))

        path.close()

        return path.cgPath
    }
}
