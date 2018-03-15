//
//  NotesListViewController.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {

	var presenter: NotesListPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

}


extension NotesListViewController: NotesListViewProtocol {
    func setupView() {
        print("viewSetup fired!")
    }
    
    
}
