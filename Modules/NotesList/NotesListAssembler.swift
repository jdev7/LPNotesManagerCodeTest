//
//  NotesListAssembler.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

class NotesListAssembler: ViewControllerAssembler<NotesListViewController> {
    
    override func registerDependencies() {
        container.register(NotesListRouter.self, factory: { _ in NotesListRouter(assembler: self.mainAssembler) })
        container.register(NotesListInteractor.self, factory: { (_, dataManager: NotesDataManager) in NotesListInteractor(dataManager: dataManager) })
        container.register(NotesListPresenter.self) { (_, view: NotesListViewController, interactor: NotesListInteractor, router: NotesListRouter) in
            return NotesListPresenter(view: view, interactor: interactor, router: router)
        }
    }
    
    override func resolveDependencies(object viewController: NotesListViewController) {
        let router = container.resolve(NotesListRouter.self)
        let dataManager = container.resolve(NotesDataManager.self)
        let interactor = container.resolve(NotesListInteractor.self, argument: dataManager!)
        let presenter = container.resolve(NotesListPresenter.self, arguments: viewController, interactor!, router!)
        
        viewController.presenter = presenter
        interactor?.output = presenter
        router?.viewController = viewController
    }
}

