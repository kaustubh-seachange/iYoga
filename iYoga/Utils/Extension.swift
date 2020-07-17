//
//  Extension.swift
//  iYoga
//
//  Created by Kaustubh on 24/06/20.
//  Copyright © 2020 Kaustubh. All rights reserved.
//

import UIKit

extension UIColor {
    static let firstColorOption = UIColor(red:185.0/255.0, green:160/255.0, blue:137/255.0, alpha:1.0)
    static let secondColorOption = UIColor(red:75.0/255.0, green:73.0/255.0, blue:72.0/255.0, alpha:1.0)
    static let thirdColorOption = UIColor(red:141.0/255.0, green:135.0/255.0, blue:132.0/255.0, alpha:1.0)
    static let fourthColorOption = UIColor(red:183.0/255.0, green:175.0/255.0, blue:171.0/255.0, alpha:1.0)
    static let whiteColorOption = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0)
}

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
