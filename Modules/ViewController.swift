//
//  ViewController.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 14/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

protocol NetworkManagerProtocol {
    func fetchData()
}

class NetworkManager: NetworkManagerProtocol {
    func fetchData() {
        print("doSomething")
    }
}

class ViewController: UIViewController {
    
    var manager: NetworkManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.fetchData()
    }
}

