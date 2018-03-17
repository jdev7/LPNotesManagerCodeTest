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
        print("Go to edit note \(assembler)")
    }
    
    func gotToAddNote() {
        print("Go to add note \(assembler)")
    }
}
