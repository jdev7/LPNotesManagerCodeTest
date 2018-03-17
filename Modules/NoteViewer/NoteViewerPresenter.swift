//
//  NoteViewerPresenter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

enum CharactersCountFeedback {
    case valid(String)
    case invalid(String)
    
    var text: String {
        switch self {
        case .valid(let text):     return text
        case .invalid(let text):   return text
        }
    }
}

class NoteViewerPresenter {
    
    struct Constants {
        static let maxCharactersCount = 140
    }

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
        return title.count > 0 && 1...Constants.maxCharactersCount ~= description.count
    }
    
    func setFeedback(for text: String) {
        let feedbackText = "\(text.count)/\(Constants.maxCharactersCount)"
        let feedback: CharactersCountFeedback = text.count <= Constants.maxCharactersCount ? .valid(feedbackText) : .invalid(feedbackText)
        view?.set(feedbackType: feedback)
    }
}

extension NoteViewerPresenter: NoteViewerPresenterProtocol {
    func viewDidLoad(noteId: String?) {
        if let noteId = noteId {
            interactor.getNote(id: noteId)
        }
        setFeedback(for: "")
    }
    
    func descriptionDidChange(text: String) {
        setFeedback(for: text)
    }
    
    func didTouchSaveNote(title: String, description: String) {
        guard validateData(title: title, description: description) else {
            router.showOkAlert(title: "Error", message: "Title and description (max 140 char) should not be empty")
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
        setFeedback(for: note.description)
    }
    
    func noteDidFinishSaving() {
        router.goBack()
    }
}
