//
//  ViewControllerAssembler.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 14/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

class MyViewControllerAssembler: ViewControllerAssembler<ViewController> {
    
    override func registerDependencies() {
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager() }
    }

    override func resolveDependencies(object viewController: ViewController) {
        viewController.manager = container.resolve(NetworkManagerProtocol.self)
    }
}
