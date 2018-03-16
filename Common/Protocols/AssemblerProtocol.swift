//
//  AssemblerProtocol.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit
import Swinject

protocol AssemblerProtocol {
    associatedtype AssembledType
    
    var container: Container { get }
    func registerDependencies()
    func resolve() -> AssembledType
    func resolveDependencies(object: AssembledType)
}

class ViewControllerAssembler<T: UIViewController>: AssemblerProtocol {
    
    typealias AssembledType = T
    
    let container: Container
    
    required init() {
        container = Container()
        register()
    }
    
    final func resolve() -> T {
        return container.resolve(T.self)!
    }
    
    func resolveDependencies(object: T) {}
    func registerDependencies() {}
    func register() {
        container.register(AssembledType.self, factory: { _ in
            let controller: AssembledType = AssembledType(nibName: String(describing: AssembledType.self), bundle: nil)
            self.resolveDependencies(object: controller)
            return controller
        })
        registerDependencies()
    }
}
