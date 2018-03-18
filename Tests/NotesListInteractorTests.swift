//
//  NotesListInteractorTests.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 14/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NotesListInteractorTests: XCTestCase {
    
    var sut: NotesListInteractor!
    var output: NotesListInteractorOutputMock!
    var dataManager: NotesDataManagerMock!
    
    override func setUp() {
        super.setUp()
        output = NotesListInteractorOutputMock()
        dataManager = NotesDataManagerMock()
        sut = NotesListInteractor(dataManager: dataManager)
        sut.output = output
    }
    
    override func tearDown() {
        output = nil
        sut = nil
        dataManager = nil
        super.tearDown()
    }
    
    func testGetNotes() {
        let note = Note(title: "Some title", description: "Some description")
        dataManager.notes = [note]
        
        sut.getNotes()
        XCTAssertTrue(output.updateNotesWasCalled)
        XCTAssertTrue(dataManager.getNotesWasCalled)
        XCTAssertEqual(output.updateNotes.count, 1)
        XCTAssertEqual(output.updateNotes[0], note)
    }
    
    class NotesListInteractorOutputMock: NotesListInteractorOutputProtocol {
        
        var updateNotesWasCalled: Bool = false
        var updateNotes: [Note]!
        
        func updateNotes(notes: [Note]) {
            updateNotes = notes
            updateNotesWasCalled = true
        }
    }
    
    class NotesDataManagerMock: NotesDataManagerProtocol {
        var notes: [Note]!
        var getNotesWasCalled: Bool = false
        
        func getNotes(completion: @escaping ([Note]) -> ()) {
            getNotesWasCalled = true
            completion(notes)
        }
        
        func save(note: Note, completion: @escaping () -> ()) {}
    }
    
}
