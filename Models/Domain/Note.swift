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
    var lastUpdated: Date
    var id: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.created = Date()
        self.lastUpdated = created
        self.id = "\(created.timeIntervalSince1970)\(arc4random_uniform(999))"
    }
}

extension Note: Comparable, Hashable {
    static func <(lhs: Note, rhs: Note) -> Bool {
        return lhs.lastUpdated < rhs.lastUpdated
    }

    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }

    var hashValue: Int {
        return id.hashValue
    }
}

