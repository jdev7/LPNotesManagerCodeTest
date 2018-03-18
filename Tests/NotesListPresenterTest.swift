//
//  NotesListPresenterTest.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NotesListPresenterTest: XCTestCase {
    
    var sut: NotesListPresenter!
    var view: NotesListViewMock!
    var interactor: NotesListInteractorInputMock!
    var router: NotesListRouterMock!
    
    override func setUp() {
        super.setUp()
        view = NotesListViewMock()
        interactor = NotesListInteractorInputMock()
        router = NotesListRouterMock()
        sut = NotesListPresenter(view: view, interactor: interactor, router: router)
        let utils = UnitTestUtils()
        note1 = utils.note1
        note2 = utils.note2
    }
    
    override func tearDown() {
        view = nil
        router = nil
        interactor = nil
        sut = nil
        note1 = nil
        note2 = nil
        super.tearDown()
    }
    
    
    
    func testGetNotesIsCalledOnViewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactor.getNotesWasCalled)
    }
    
    func testViewIsUpdatedWhenNotesAreFetched() {
        let notes = [note1!, note2!]
        sut.updateNotes(notes: notes)
        XCTAssertTrue(view.updateViewWasCalled)
        XCTAssertEqual(view.updateViewNotes.count, notes.count)
    }
    
    func testNotesAreSortedByLatestLastUpdated() {
        sut.updateNotes(notes: [note1, note2])
        
        XCTAssertEqual(sut.notes[0], note2)
        XCTAssertEqual(sut.notes[1], note1)
    }
    
    func testTouchAddNoteGoesToAddNote() {
        sut.didTouchAddNote()
        XCTAssertTrue(router.goToAddWasCalled)
    }
    
    func testTouchEditNoteGoesToEditNote() {
        sut.notes = [note1, note2]
        sut.didSelectNote(at: 0)
        
        XCTAssertTrue(router.goToEditWasCalled)
        XCTAssertEqual(router.goToEditNoteId, sut.notes[0].id)
    }
    
    private var note1: Note!
    private var note2: Note!
    
    class NotesListViewMock: NotesListViewProtocol {
        
        var updateViewWasCalled: Bool = false
        var updateViewNotes: [PresentationNote]!
        
        func updateView(notes: [PresentationNote]) {
            updateViewNotes = notes
            updateViewWasCalled = true
        }
    }
    
    class NotesListInteractorInputMock: NotesListInteractorInputProtocol {
        var getNotesWasCalled: Bool = false
        func getNotes() { getNotesWasCalled = true }
    }
    
    class NotesListRouterMock: NotesListWireframeProtocol {
        var goToEditWasCalled = false
        var goToEditNoteId: String!
        func goToEditNote(id: String) {
            goToEditWasCalled = true
            goToEditNoteId = id
        }
        
        var goToAddWasCalled = false
        func goToAddNote() {
            goToAddWasCalled = true
        }
        
        var viewController: UIViewController?
    }
}
