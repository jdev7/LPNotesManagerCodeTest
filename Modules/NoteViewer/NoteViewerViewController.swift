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

    @IBOutlet weak var charCountLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionContainer: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad(noteId: noteId)
        
    }
    
    func setupView() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTouchSaveButton))
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        descriptionContainer.layer.borderColor = UIColor.lightGray.cgColor
        descriptionContainer.layer.borderWidth = 0.5
        descriptionContainer.layer.cornerRadius = 6.0
        descriptionContainer.layer.masksToBounds = true
        
        descriptionTextView.delegate = self
    }
    
    @objc func didTouchSaveButton() {
        presenter?.didTouchSaveNote(title: titleTextField.text ?? "", description: descriptionTextView.text)
    }

}

extension CharactersCountFeedback {
    var color: UIColor {
        switch self {
        case .valid(_):     return .lpGreen
        case .invalid(_):   return .lpRed
        }
    }
}


extension NoteViewerViewController: NoteViewerViewProtocol {
    func set(feedbackType: CharactersCountFeedback) {
        charCountLabel.text = feedbackType.text
        charCountLabel.textColor = feedbackType.color
    }
    
    func loadNote(note: PresentationNote) {
        print("\ntitle: \(note.title)\ndescription: \(note.description)")
    }
}

extension NoteViewerViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter?.descriptionDidChange(text: textView.text)
    }
}
