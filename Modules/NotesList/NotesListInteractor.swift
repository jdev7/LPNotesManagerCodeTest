//
//  NotesListInteractor.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

class NotesListInteractor {

    weak var output: NotesListInteractorOutputProtocol?

    private let dataManager: NotesDataManagerProtocol
    
    init(dataManager: NotesDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension NotesListInteractor: NotesListInteractorInputProtocol {
    func getNotes() {
        dataManager.getNotes() { notes in
            self.output?.updateNotes(notes: notes)
        }
    }
}
