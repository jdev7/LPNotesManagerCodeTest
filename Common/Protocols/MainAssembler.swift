//
//  MainAssembler.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 16/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit
import Swinject

class MainAssembler {
    
    let container: Container
    
    init() {
        container = Container()
        registerDependencies()
    }
    
    func registerDependencies() {
        container.register(ViewControllerAssembler<NotesListViewController>.self, factory: { _ in NotesListAssembler() })
    }
    
    func resolve<T: UIViewController>() -> T {
        return container.resolve(ViewControllerAssembler<T>.self)!.resolve()
    }

}
