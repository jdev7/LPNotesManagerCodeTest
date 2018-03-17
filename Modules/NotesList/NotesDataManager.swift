//
//  NotesDataManager.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

class NotesDataManager: NotesDataManagerProtocol {
    
    private var notes: [Note] = []
    
    func getNotes() -> [Note] {
        return notes
    }
    
}
