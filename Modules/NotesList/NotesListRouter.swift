//
//  NotesListRouter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import UIKit

class NotesListRouter: NotesListWireframeProtocol {
    weak var viewController: UIViewController?
    
    private weak var assembler: MainAssembler!
    
    init(assembler: MainAssembler) {
        self.assembler = assembler
    }
    
    func goToEditNote(id: String) {
        goToNoteViewer(id: id)
    }
    
    func goToAddNote() {
        goToNoteViewer()
    }
    
    private func goToNoteViewer(id: String? = nil) {
        let vc: NoteViewerViewController = assembler.resolve()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
