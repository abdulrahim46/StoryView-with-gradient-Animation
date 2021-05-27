//
//  Constants.swift
//  LifeTap
//
//  Created by Abdul Rahim on 26/05/21.
//

import UIKit


public struct Theme {
    //Theme Red Orange
    static let redOrange = UIColor.rgb(from: 0xe95950)
    
}

/// rgb extension
extension UIColor {
    class func rgb(from hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((hex & 0x00FF00) >> 8) / 0xFF
        let blue = CGFloat(hex & 0x0000FF) / 0xFF
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

///Attributes for layer
struct Attributes {
    let borderWidth:CGFloat = 2.0
    let borderColor = UIColor.systemBackground
    let backgroundColor = Theme.redOrange
    let size = CGSize(width:68,height:68)
}

