//
//  NoteViewerViewController.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 17/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

class NoteViewerViewController: UIViewController {

	var presenter: NoteViewerPresenterProtocol?
    
    var noteId: String?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(noteId: noteId)
    }

}


extension NoteViewerViewController: NoteViewerViewProtocol {
    func loadNote(note: PresentationNote) {
        print("\ntitle: \(note.title)\ndescription: \(note.description)")
    }
    
    
}
