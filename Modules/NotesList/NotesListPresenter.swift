//
//  NotesListPresenter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

protocol PresentationNote {
    var title: String { get }
    var description: String { get }
}

extension Note: PresentationNote {}

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
    func didSelectNote(at index: Int) {
        
    }
    
    func viewDidLoad() {
        interactor.getNotes()
    }
}

extension NotesListPresenter: NotesListInteractorOutputProtocol {
    func updateNotes(notes: [Note]) {
        view?.updateView(notes: notes)
    }    
}
