//
//  NoteViewerRouter.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import UIKit

class NoteViewerRouter: NoteViewerWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    private weak var assembler: MainAssembler!
    
    init(assembler: MainAssembler) {
        self.assembler = assembler
    }
}
