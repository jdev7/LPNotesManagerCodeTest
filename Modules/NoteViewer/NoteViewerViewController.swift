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

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension NoteViewerViewController: NoteViewerViewProtocol {
    
}
