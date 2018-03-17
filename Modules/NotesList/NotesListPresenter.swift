//
//  NotesListPresenter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

class NotesListPresenter {

    var interactor: NotesListInteractorInputProtocol
    private weak var view: NotesListViewProtocol?
    private let router: NotesListWireframeProtocol

    init(view: NotesListViewProtocol, interactor: NotesListInteractorInputProtocol, router: NotesListWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

}

extension NotesListPresenter: NotesListPresenterProtocol {
    func viewDidLoad() {
        interactor.getNotes()
    }
}

extension NotesListPresenter: NotesListInteractorOutputProtocol {
    func updateNotes(notes: [Note]) {
        print(notes)
        view?.setupView()
    }    
}
