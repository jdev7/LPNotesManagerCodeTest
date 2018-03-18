//
//  CommonMocks.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation
@testable import LPNotesManagerCodeTest


class NotesDataManagerMock: NotesDataManagerProtocol {
    var notes: [Note]!
    var getNotesWasCalled: Bool = false
    
    func getNotes(completion: @escaping ([Note]) -> ()) {
        getNotesWasCalled = true
        completion(notes)
    }
    
    var note: Note!
    var saveNoteWasCalled = false
    func save(note: Note, completion: @escaping () -> ()) {
        self.note = note
        saveNoteWasCalled = true
        completion()
    }
}
