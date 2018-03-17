//
//  NotesListRouter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import UIKit

class NotesListRouter: NotesListWireframeProtocol {
    weak var viewController: UIViewController?
    
    func goToEditNote(id: String) {
        print("Go to edit note")
    }
    
    func gotToAddNote() {
        print("Go to add note")
    }
}
