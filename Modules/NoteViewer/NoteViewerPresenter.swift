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
    
    var note: Note?

    init(view: NoteViewerViewProtocol, interactor: NoteViewerInteractorInputProtocol, router: NoteViewerWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func validateData(title: String, description: String) -> Bool {
        return title.count > 0 && 0...140 ~= description.count
    }

}

extension NoteViewerPresenter: NoteViewerPresenterProtocol {
    func viewDidLoad(noteId: String?) {
        if let noteId = noteId {
            interactor.getNote(id: noteId)
        }
    }
    
    func didTouchSaveNote(title: String, description: String) {
        guard validateData(title: title, description: description) else {
//            view.showError()
            return
        }
        
        let noteToSave: Note
        if var note = note {
            note.title = title
            note.description = description
            noteToSave = note
        }
        else {
            noteToSave = Note(title: title, description: description)
        }
        interactor.saveNote(note: noteToSave)
    }
    
    
}

extension NoteViewerPresenter: NoteViewerInteractorOutputProtocol {
    func noteFetched(note: Note) {
        self.note = note
        view?.loadNote(note: note)
    }
    
    func noteDidFinishSaving() {
        
    }
    
    
}
