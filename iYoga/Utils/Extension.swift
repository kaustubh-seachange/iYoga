//
//  Extension.swift
//  iYoga
//
//  Created by Kaustubh on 24/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

extension NSObject {
    func loggerMin(_ message: String, function: String = #function, line: Int = #line) {
        print("{\(function):\(line)} :) \(message)")
    }
    
    func logger(_ message: String,
                file: String = #file,
                function: String = #function,
                line: Int = #line,
                column: Int = #column) {
        print("{\(file)->\(function):\(line)[\(column)]} :) \(message)")
    }
}

extension UIColor {
    static let firstColorOption = UIColor(red:185.0/255.0, green:160/255.0, blue:137/255.0, alpha:1.0)
    static let secondColorOption = UIColor(red:75.0/255.0, green:73.0/255.0, blue:72.0/255.0, alpha:1.0)
    static let thirdColorOption = UIColor(red:141.0/255.0, green:135.0/255.0, blue:132.0/255.0, alpha:1.0)
    static let fourthColorOption = UIColor(red:183.0/255.0, green:175.0/255.0, blue:171.0/255.0, alpha:1.0)
    static let whiteColorOption = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
}

extension UIImageView {
    func bottomCornersRounded(cornerRadius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}

extension UITabBar {
    func topCornersRounded(cornerRadius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.shadowOffset = CGSize(width:0, height:0)
        shapeLayer.shadowRadius = 6
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOpacity = 0.2
        self.layer.mask = shapeLayer
    }
}

extension UITabBarController {
    func slideTabBar(isUp: Bool, animated: Bool) {
        let aFrame = self.tabBar.frame
        let aHeight = aFrame.size.height
        let offsetY = (isUp ? -aHeight : aHeight)
        UIView.animate(withDuration: animated ? 0.3 : 0.0) {
            self.tabBar.frame = aFrame.offsetBy(dx: 0, dy: 2*offsetY)
            self.tabBar.setNeedsDisplay()
            self.tabBar.layoutIfNeeded()
        }
    }
}
