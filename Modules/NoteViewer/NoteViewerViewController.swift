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
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTouchSaveButton))
        navigationItem.setRightBarButton(saveButton, animated: true)
        presenter?.viewDidLoad(noteId: noteId)
    }
    
    @objc func didTouchSaveButton() {
        presenter?.didTouchSaveNote(title: "prueba\(arc4random_uniform(999))", description: "descripción!!")
    }

}


extension NoteViewerViewController: NoteViewerViewProtocol {
    func loadNote(note: PresentationNote) {
        print("\ntitle: \(note.title)\ndescription: \(note.description)")
    }
    
    
}
