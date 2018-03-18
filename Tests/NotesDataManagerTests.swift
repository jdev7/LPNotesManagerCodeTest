//
//  NotesDataManagerTests.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NotesDataManagerTests: XCTestCase {
    
    var sut: NotesDataManager!
    var utils: UnitTestUtils!
    override func setUp() {
        super.setUp()
        sut = NotesDataManager()
        utils = UnitTestUtils()
    }
    
    override func tearDown() {
        sut = nil
        utils = nil
        super.tearDown()
    }
    
    func testGetNotesReturnNotesVar() {
        let notes = [utils.note1, utils.note2]
        sut.notes = Set(notes)
        
        let expectation = XCTestExpectation(description: "notesExpectation")
        sut.getNotes { (notesFetched) in
            XCTAssertEqual(notesFetched, notes)
            expectation.fulfill()
        }
        XCTAssertEqual(XCTWaiter.wait(for: [expectation], timeout: 0.3), .completed)
        
    }
    
    func testSaveNonExistingNoteShouldAddNewOne() {
        let totalNotesBeforeUpdate = sut.notes.count
        let note1 = utils.note1
        
        let expectation = XCTestExpectation(description: "saveNote")
        sut.save(note: note1) {
            expectation.fulfill()
        }
        XCTAssertEqual(XCTWaiter.wait(for: [expectation], timeout: 0.3), .completed)
        XCTAssertEqual(totalNotesBeforeUpdate + 1, sut.notes.count)
    }
    
    func testSaveExistingNoteShouldNotAddNewOneButUpdateIt() {
        let totalNotesBeforeUpdate = sut.notes.count
        var note1 = sut.notes.first!
        let title = note1.title
        let id = note1.id
        
        note1.title = "title2"
        
        let expectation = XCTestExpectation(description: "saveNote")
        sut.save(note: note1) {
            expectation.fulfill()
        }
        
        XCTAssertEqual(XCTWaiter.wait(for: [expectation], timeout: 0.3), .completed)
        
        let testedNote = sut.notes.first { $0.id == id }
        XCTAssertNotNil(testedNote)
        XCTAssertNotEqual(testedNote?.title, title)
        XCTAssertEqual(totalNotesBeforeUpdate, sut.notes.count)
    }
    
}
