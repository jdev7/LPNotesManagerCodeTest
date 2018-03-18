//
//  NotesViewerPresenterTests.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NotesViewerPresenterTests: XCTestCase {
    
    var sut: NoteViewerPresenterProtocol!
    var sut2: NoteViewerInteractorOutputProtocol!
    var presenter: NoteViewerPresenter!
    var router: NoteViewerWireframeMock!
    var view: NoteViewerViewMock!
    var interactor: NoteViewerInteractorInputMock!
    
    
    override func setUp() {
        super.setUp()
        router = NoteViewerWireframeMock()
        interactor = NoteViewerInteractorInputMock()
        view = NoteViewerViewMock()
        presenter = NoteViewerPresenter(view: view, interactor: interactor, router: router)
        sut = presenter
        sut2 = presenter
    }
    
    override func tearDown() {
        router = nil
        interactor = nil
        view = nil
        sut = nil
        sut2 = nil
        presenter = nil
        super.tearDown()
    }
    
    func testViewDidLoadWithEmptyNoteSetsFeedback() {
        sut.viewDidLoad(noteId: nil)
        XCTAssertTrue(view.setFeedbackIsCalled)
    }
    
    func testViewDidLoadWithSomeNoteSetsFeedbackAndFetchesNote() {
        sut.viewDidLoad(noteId: "123")
        XCTAssertTrue(view.setFeedbackIsCalled)
        XCTAssertTrue(interactor.getNoteWasCalled)
        XCTAssertEqual(interactor.noteId, "123")
    }
    
    func testSaveNoteValidatesEmptyTitleShowsAlertAndDoesntSave() {
        sut.didTouchSaveNote(title: "", description: "123")
        XCTAssertTrue(router.showAlertWasCalled)
    }
    
    func testSaveNoteValidatesEmptyDescriptionShowsAlertAndDoesntSave() {
        sut.didTouchSaveNote(title: "123", description: "")
        XCTAssertTrue(router.showAlertWasCalled)
        XCTAssertFalse(interactor.saveNoteWasCalled)
    }
    
    func testSaveNoteValidatesLongerThan140CharsDescriptionShowsAlertAndDoesntSave() {
        let description = UnitTestUtils.generateText(lenght: 141)
        sut.didTouchSaveNote(title: "123", description: description)
        XCTAssertTrue(router.showAlertWasCalled)
        XCTAssertFalse(interactor.saveNoteWasCalled)
    }
    
    func testSaveNoteValidatesLessThan140CharsDescriptionDoesntShowAlertAndSaves() {
        let description = UnitTestUtils.generateText(lenght: 140)
        sut.didTouchSaveNote(title: "123", description: description)
        XCTAssertFalse(router.showAlertWasCalled)
        XCTAssertTrue(interactor.saveNoteWasCalled)
    }
    
    func testSaveExistingNote() {
        let note = UnitTestUtils().note1
        presenter.note = note
        sut.didTouchSaveNote(title: "Otro título para este test", description: "Otra descripción para el test")
        XCTAssertTrue(interactor.saveNoteWasCalled)
        XCTAssertEqual(note, interactor.note)
        XCTAssertNotEqual(note.title, interactor.note.title)
    }
    
    func testSaveNonExistingNote() {
        sut.didTouchSaveNote(title: "Otro título para este test", description: "Otra descripción para el test")
        XCTAssertTrue(interactor.saveNoteWasCalled)
        XCTAssertNotNil(interactor.note)
    }
    
    func testFinishSavingGoesBack() {
        sut2.noteDidFinishSaving()
        XCTAssertTrue(router.goBackWasCalled)
    }
    
    func testFetchingNoteLoadsViewAndFeedback() {
        let note = UnitTestUtils().note1
        sut2.noteFetched(note: note)
        XCTAssertTrue(view.loadNoteIsCalled)
        XCTAssertEqual(note.title, view.note.title)
        XCTAssertEqual(note.description, view.note.description)
        XCTAssertTrue(view.setFeedbackIsCalled)
    }
    
    func testFetchingLongNoteSetsInvalidFeedback() {
        let note = Note(title: "some title", description: UnitTestUtils.generateText(lenght: 141))
        sut2.noteFetched(note: note)
        XCTAssertEqual(view.feedbackType, CharactersCountFeedback.invalid(""))
    }
    
    func testFetchingLessThan140NoteSetsValidFeedback() {
        let note = Note(title: "some title", description: "some description")
        sut2.noteFetched(note: note)
        XCTAssertEqual(view.feedbackType, CharactersCountFeedback.valid(""))
    }
    
    func testDescriptionChangedUpdatesFeedback() {
        sut.descriptionDidChange(text: "")
        XCTAssertTrue(view.setFeedbackIsCalled)
    }
    
    func testDescriptionChangedLongerThan140GivesInvalidFeedback() {
        sut.descriptionDidChange(text: UnitTestUtils.generateText(lenght: 141))
        XCTAssertEqual(view.feedbackType, CharactersCountFeedback.invalid(""))
    }
    
    func testDescriptionChangedShorterThan140GivesValidFeedback() {
        sut.descriptionDidChange(text: UnitTestUtils.generateText(lenght: 10))
        XCTAssertEqual(view.feedbackType, CharactersCountFeedback.valid(""))
    }
    
    class NoteViewerViewMock: NoteViewerViewProtocol {
        var note: PresentationNote!
        var loadNoteIsCalled = false
        func loadNote(note: PresentationNote) {
            self.note = note
            loadNoteIsCalled = true
        }
        
        var feedbackType: CharactersCountFeedback!
        var setFeedbackIsCalled = false
        func set(feedbackType: CharactersCountFeedback) {
            self.feedbackType = feedbackType
            setFeedbackIsCalled = true
        }
        
    }
    
    class NoteViewerInteractorInputMock: NoteViewerInteractorInputProtocol {
        
        var noteId: String!
        var getNoteWasCalled = false
        func getNote(id: String) {
            noteId = id
            getNoteWasCalled = true
        }
        
        var note: Note!
        var saveNoteWasCalled = false
        func saveNote(note: Note) {
            self.note = note
            saveNoteWasCalled = true
        }
        
        
    }
    
    class NoteViewerWireframeMock: NoteViewerWireframeProtocol {
        var viewController: UIViewController?
        
        var showAlertWasCalled = false
        func showOkAlert(title: String, message: String) { showAlertWasCalled = true }
    
        var goBackWasCalled = false
        func goBack() { goBackWasCalled = true }
    }
    
    
}

extension CharactersCountFeedback: Equatable {
    public static func ==(lhs: CharactersCountFeedback, rhs: CharactersCountFeedback) -> Bool {
        switch (lhs, rhs) {
        case (CharactersCountFeedback.invalid(_), CharactersCountFeedback.invalid(_)),
             (CharactersCountFeedback.valid(_), CharactersCountFeedback.valid(_)):
            return true
        default:
            return false
        }
    }
}
