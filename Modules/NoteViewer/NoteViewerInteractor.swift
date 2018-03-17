//
//  NoteViewerInteractor.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

class NoteViewerInteractor {

    weak var output: NoteViewerInteractorOutputProtocol?
    
    private let dataManager: NotesDataManagerProtocol
    
    init(dataManager: NotesDataManagerProtocol) {
        self.dataManager = dataManager
    }
}

extension NoteViewerInteractor: NoteViewerInteractorInputProtocol {
    
}
