//
//  UIStoryboardExtension.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>() -> T {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}
