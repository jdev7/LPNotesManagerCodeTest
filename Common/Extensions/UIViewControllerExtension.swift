//
//  UIViewControllerExtension.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

extension UIViewController {
    func showOkAlert(title: String = " ", message: String) {
        showAlert(title: title, message: message)
    }
    
    private func showAlert(title: String, message: String, ok: UIAlertAction? = nil, cancel: UIAlertAction = UIAlertAction(title: "ok", style: .cancel, handler: nil), completion: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let okAction = ok {
            alert.addAction(okAction)
        }
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: completion)
    }
}


