//
//  NoteViewerProtocols.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol NoteViewerWireframeProtocol: class {

}

//MARK: Presenter -
protocol NoteViewerPresenterProtocol: class {
    func viewDidLoad(noteId: String?)
    func descriptionDidChange(text: String)
    func didTouchSaveNote(title: String, description: String)
}

//MARK: Interactor Input -
protocol NoteViewerInteractorInputProtocol: class {
    func getNote(id: String)
    func saveNote(note: Note)
}

//MARK: Interactor Output -
protocol NoteViewerInteractorOutputProtocol: class {
    func noteFetched(note: Note)
    func noteDidFinishSaving()
}


//MARK: View -
protocol NoteViewerViewProtocol: class {
    func loadNote(note: PresentationNote)
    func set(feedbackType: CharactersCountFeedback)
}
