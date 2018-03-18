//
//  TestUtils.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import Foundation
@testable import LPNotesManagerCodeTest

class UnitTestUtils {
    var note1 = Note(title: "titulo1", description: "description1")
    var note2 = Note(title: "titulo2", description: "description2")
    
    static func generateText(lenght: Int) -> String {
        let array: [String] = (0..<lenght).map { _ in "a" }
        return array.joined()
    }
}
