//
//  NotesListInteractor.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

class NotesListInteractor {

    weak var output: NotesListInteractorOutputProtocol?
}

extension NotesListInteractor: NotesListInteractorInputProtocol {
    func prepareData() {
        output?.updateData()
    }    
}
