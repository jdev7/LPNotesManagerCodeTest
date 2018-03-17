//
//  UIColor.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

extension UIColor {
    static var lpGreenColor: UIColor {
        return .rgbColor(red: 26, green: 188, blue: 156, alpha: 1)
    }
    
    private static func rgbColor(red: Float, green: Float, blue: Float, alpha: Float) -> UIColor {
        return UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: CGFloat(alpha))
    }
}
