//
//  NoteViewerAssembler.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

class NotesViewerAssembler: ViewControllerAssembler<NoteViewerViewController> {
    
    override func registerDependencies() {
        container.register(NoteViewerRouter.self, factory: { _ in NoteViewerRouter(assembler: self.mainAssembler) })
        container.register(NoteViewerInteractor.self, factory: { (_, dataManager: NotesDataManager) in NoteViewerInteractor(dataManager: dataManager) })
        container.register(NoteViewerPresenter.self) { (_, view: NoteViewerViewController, interactor: NoteViewerInteractor, router: NoteViewerRouter) in
            return NoteViewerPresenter(view: view, interactor: interactor, router: router)
        }
    }
    
    override func resolveDependencies(object viewController: NoteViewerViewController) {
        let router = container.resolve(NoteViewerRouter.self)
        let dataManager = container.resolve(NotesDataManager.self)
        let interactor = container.resolve(NoteViewerInteractor.self, argument: dataManager!)
        let presenter = container.resolve(NoteViewerPresenter.self, arguments: viewController, interactor!, router!)
        
        viewController.presenter = presenter
        interactor?.output = presenter
        router?.viewController = viewController
    }
}
