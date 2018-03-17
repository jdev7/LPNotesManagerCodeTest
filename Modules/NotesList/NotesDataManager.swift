//
//  NotesDataManager.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

class NotesDataManager: NotesDataManagerProtocol {
    
    private var _notes: Set<Note> = [Note(title: "titulo 1", description: "una descripción de ejemplo"), Note(title: "titulo 2", description: "otra descripción de ejemplo, pero bastante más larga para que no quepa en 2 líneas; así podré ver que el truncado funciona correctamente")]
    
    private let synchronizationQueue: DispatchQueue = {
        let name = String(format: "net.perhapps.lpNotesManagerCodeTest-%08x%08x", arc4random(), arc4random())
        return DispatchQueue(label: name)
    }()
    
    private var notes: Set<Note> {
        set {
            synchronizationQueue.sync {
                _notes = newValue
            }
        }
        get {
            var result: Set<Note>?
            synchronizationQueue.sync {
                result = _notes
            }
            return result!
        }
    }
    
    
    func getNotes(completion: @escaping ([Note]) -> ()) {
        DispatchQueue.global(qos: .default).async {
            let notes = Array(self.notes)
            DispatchQueue.main.async {
                completion(notes)
            }
        }
    }
    
    func save(note: Note, completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .default).async {
            self.notes.update(with: note)
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
}
