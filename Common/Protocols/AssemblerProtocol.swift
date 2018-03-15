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
    associatedtype ViewControllerType: UIViewController
    
    var container: Container { get }
    func registerDependencies()
    func resolve() -> ViewControllerType
    func resolveDependencies(viewController: ViewControllerType)
}

class BaseAssembler<T: UIViewController>: AssemblerProtocol {
    
    typealias ViewControllerType = T
    
    let container: Container
    
    required init() {
        container = Container()
        registerAllDependencies()
    }
    
    final func resolve() -> T {
        return container.resolve(T.self)!
    }
    
    func resolveDependencies(viewController: T) {}
    func registerDependencies() {}
    
    private func registerAllDependencies() {
        container.register(T.self, factory: { _ in
            let controller: T = T(nibName: String(describing: T.self), bundle: nil)
            self.resolveDependencies(viewController: controller)
            return controller
        })
        registerDependencies()
    }
    
}
