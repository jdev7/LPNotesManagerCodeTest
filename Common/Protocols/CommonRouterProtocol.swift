//
//  CommonRouterProtocol.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

protocol CommonRouterProtocol: class {
    var viewController: UIViewController? { get }
    func showOkAlert(message: String)
    func showOkAlert(title: String, message: String)
    func goBack()
}


extension CommonRouterProtocol {
    func showOkAlert(message: String) {
        viewController?.showOkAlert(message: message)
    }
    
    func showOkAlert(title: String, message: String) {
        viewController?.showOkAlert(title: title, message: message)
    }
    
    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
