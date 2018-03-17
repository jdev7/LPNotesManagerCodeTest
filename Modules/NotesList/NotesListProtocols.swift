//
//  NotesListProtocols.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol NotesListWireframeProtocol: CommonRouterProtocol {
    func goToEditNote(id: String)
    func goToAddNote()
}

//MARK: Presenter -
protocol NotesListPresenterProtocol: class {  
    func viewDidLoad()
    func didSelectNote(at index: Int)
    func didTouchAddNote()
}

//MARK: Interactor Input -
protocol NotesListInteractorInputProtocol: class {
    func getNotes()
}

//MARK: Interactor Output -
protocol NotesListInteractorOutputProtocol: class {
    func updateNotes(notes: [Note])
}

//MARK: View -
protocol NotesListViewProtocol: class {
    func updateView(notes: [PresentationNote])
}

//MARK: DataManager -
protocol NotesDataManagerProtocol {
    func getNotes(completion: @escaping (_ notes: [Note]) -> ())
    func save(note: Note, completion: @escaping () -> ())
}
