//
//  DataManagerProtocol.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

protocol NotesDataManagerProtocol {
    func getNotes(completion: @escaping (_ notes: [Note]) -> ())
    func save(note: Note, completion: @escaping () -> ())
}
