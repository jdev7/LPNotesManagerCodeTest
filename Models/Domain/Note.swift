//
//  Note.swift
//  LPNotesManagerCodeTest
//
//  Created by Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation

struct Note {
    var title: String
    var description: String
    var created: Date
    var id: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.created = Date()
        self.id = "\(created.timeIntervalSince1970)"
    }
}

extension Note: Comparable {
    static func <(lhs: Note, rhs: Note) -> Bool {
        return lhs.created < lhs.created
    }

    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}
