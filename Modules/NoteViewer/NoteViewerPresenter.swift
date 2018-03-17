//
//  NoteViewerPresenter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

class NoteViewerPresenter {

    var interactor: NoteViewerInteractorInputProtocol
    private weak var view: NoteViewerViewProtocol?
    private let router: NoteViewerWireframeProtocol

    init(view: NoteViewerViewProtocol, interactor: NoteViewerInteractorInputProtocol, router: NoteViewerWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension NoteViewerPresenter: NoteViewerPresenterProtocol {
    
}

extension NoteViewerPresenter: NoteViewerInteractorOutputProtocol {
    
}
