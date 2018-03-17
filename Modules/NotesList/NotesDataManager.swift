//
//  NotesDataManager.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

class NotesDataManager: NotesDataManagerProtocol {
    
    private var notes: Set<Note> = [Note(title: "titulo 1", description: "una descripción"), Note(title: "titulo 2", description: "otra descripción cualquiera, que es mucho más larga y debería no caber en 2 líneas para ver la elipsis, y ver que funciona correctamente")]
    
    func getNotes() -> [Note] {
        return Array(notes)
    }
    
    func save(note: Note) {
        notes.insert(note)
    }
}
