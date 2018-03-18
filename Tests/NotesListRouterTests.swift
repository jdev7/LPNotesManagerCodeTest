//
//  NotesListRouterTests.swift
//  LPNotesManagerCodeTestTests
//
//  Created by Juan Navas Martin on 18/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import XCTest
@testable import LPNotesManagerCodeTest

class NotesListRouterTests: XCTestCase {
    
    var sut: NotesListRouter!
    var mockedAssembler: MockedAssembler!
    
    override func setUp() {
        super.setUp()
        mockedAssembler = MockedAssembler()
        sut = NotesListRouter(assembler: mockedAssembler)
    }
    
    override func tearDown() {
        mockedAssembler = nil
        sut = nil
        super.tearDown()
    }
    
    func testGoToAddNoteShouldLoadNoteViewerController() {
        sut.goToAddNote()
        
        XCTAssertNotNil(mockedAssembler.resolveWasCalled)
        XCTAssertNotNil(mockedAssembler.viewController)
        XCTAssertTrue(mockedAssembler.viewController! is NoteViewerViewController)
    }
    
    func testGoToEditNoteShouldLoadNoteViewerControllerWithNote() {
        sut.goToEditNote(id: "123")
        
        XCTAssertNotNil(mockedAssembler.resolveWasCalled)
        XCTAssertNotNil(mockedAssembler.viewController)
        XCTAssertTrue(mockedAssembler.viewController! is NoteViewerViewController)
        XCTAssertEqual((mockedAssembler.viewController! as! NoteViewerViewController).noteId ?? "", "123")
    }
    
}

class MockedAssembler: MainAssembler {
    var resolveWasCalled = false
    var viewController: UIViewController?
    override func resolve<T>() -> T where T : UIViewController {
        let vc: T = super.resolve()
        viewController = vc
        resolveWasCalled = true
        return vc
    }
}
