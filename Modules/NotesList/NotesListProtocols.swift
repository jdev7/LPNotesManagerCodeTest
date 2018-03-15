//
//  NotesListProtocols.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.

import Foundation

//MARK: Wireframe -
protocol NotesListWireframeProtocol: class {

}
//MARK: Presenter -
protocol NotesListPresenterProtocol: class {
    func viewDidLoad()
}

//MARK: Interactor Input -
protocol NotesListInteractorInputProtocol: class {
    func prepareData()
}

//MARK: Interactor Output -
protocol NotesListInteractorOutputProtocol: class {
    func updateData()
}


//MARK: View -
protocol NotesListViewProtocol: class {
    func setupView()
}
