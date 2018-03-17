//
//  NotesListViewController.swift
//  LPNotesManagerCodeTest
//
//  Created Juan Navas Martin on 15/3/18.
//  Copyright © 2018 Perhapps. All rights reserved.
//

import UIKit

class NotesListViewController: UIViewController {
    
    struct Constants {
        static let cellNoteIdentifier = "cellNoteIdentifier"
    }

	var presenter: NotesListPresenterProtocol?
    private var notes: [PresentationNote] = []

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var addNoteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        presenter?.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setupViews() {
        titleLabel.textColor = .lpGreen
        addNoteButton.backgroundColor = .lpGreen
        addNoteButton.setTitleColor(.white, for: .normal)
        addNoteButton.setTitleColor(UIColor.lightGray, for: .selected)
        addNoteButton.layer.cornerRadius = 6.0
        addNoteButton.layer.masksToBounds = true
        
        navigationController?.navigationBar.barTintColor = .lpGreen
        navigationController?.navigationBar.tintColor = .white
        
        setupTableView()
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 50.0
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.allowsMultipleSelection = false
        tableview.register(UINib(nibName: String(describing: NoteCell.self), bundle: nil), forCellReuseIdentifier: Constants.cellNoteIdentifier)
    }
    
    
    
    @IBAction func addNoteButtonTouched(_ sender: Any) {
        presenter?.didTouchAddNote()
    }
    
}


extension NotesListViewController: NotesListViewProtocol {
    
    func updateView(notes: [PresentationNote]) {
        self.notes = notes
        tableview.reloadData()
    }
}

extension NotesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellNoteIdentifier, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        
        cell.titleLabel.text = note.title
        cell.descriptionLabel.text = note.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectNote(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
