//
//  NoteViewerInteractorTests.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NoteViewerInteractorTests: XCTestCase {
    
    var sut: NoteViewerInteractorInputProtocol!
    var interactor: NoteViewerInteractor!
    var dataManager: NotesDataManagerMock!
    var output: NoteViewerInteractorOutputMock!
    
    override func setUp() {
        super.setUp()
        output = NoteViewerInteractorOutputMock()
        dataManager = NotesDataManagerMock()
        interactor = NoteViewerInteractor(dataManager: dataManager)
        sut = interactor
        interactor.output = output
    }
    
    override func tearDown() {
        dataManager = nil
        interactor = nil
        output = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetNotesCallDataManagerAndOutput() {
        let note = UnitTestUtils().note1
        dataManager.notes = [note]
        sut.getNote(id: note.id)
        XCTAssertTrue(dataManager.getNotesWasCalled)
        XCTAssertTrue(output.noteFetchedWasCalled)
    }
    
    func testSaveNoteSavesNoteAndNotifiesOutput() {
        let note = UnitTestUtils().note1
        dataManager.notes = [note]
        sut.saveNote(note: note)
        XCTAssertEqual(dataManager.note, note)
        XCTAssertTrue(dataManager.saveNoteWasCalled)
        XCTAssertTrue(output.noteDidFinishSavingWasCalled)
    }
    
    class NoteViewerInteractorOutputMock: NoteViewerInteractorOutputProtocol {
        var noteFetchedWasCalled = false
        var note: Note!
        func noteFetched(note: Note) {
            self.note = note
            noteFetchedWasCalled = true
        }
        
        var noteDidFinishSavingWasCalled = false
        func noteDidFinishSaving() { noteDidFinishSavingWasCalled = true }
    }
}
