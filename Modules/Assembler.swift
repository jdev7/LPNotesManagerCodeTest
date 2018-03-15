//
//  Assembler.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 14/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

import Swinject

extension UIStoryboard {
    static func instantiateViewController<T: UIViewController>() -> T {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}

class ViewControllerAssembler: BaseUIViewControllerAssembler<ViewController> {
    
    override func registerDependencies() {
        super.registerDependencies()
        container.register(NetworkManagerProtocol.self) { _ in NetworkManager() }
    }

    override func resolveDependencies(viewController: ViewController) {
        viewController.manager = container.resolve(NetworkManagerProtocol.self)
    }
}

protocol UIViewControllerAssemblerProtocol {
    associatedtype ViewControllerType: UIViewController
    
    var container: Container { get }
    func registerDependencies()
    func resolve() -> ViewControllerType
    func resolveDependencies(viewController: ViewControllerType)
}

class BaseUIViewControllerAssembler<T: UIViewController>: UIViewControllerAssemblerProtocol {
    
    typealias ViewControllerType = T
    
    let container: Container
        
    required init() {
        container = Container()
        registerDependencies()
    }
    
    final func resolve() -> T {
        return container.resolve(T.self)!
    }
    
    func resolveDependencies(viewController: T) {
        fatalError("must be implemented by superclass")
    }
    
    func registerDependencies() {
        container.register(T.self, factory: { _ in
            let controller: T = UIStoryboard.instantiateViewController()
            self.resolveDependencies(viewController: controller)
            return controller
        })
    }
}
