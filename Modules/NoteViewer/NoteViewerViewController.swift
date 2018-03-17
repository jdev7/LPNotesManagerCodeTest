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
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad(noteId: noteId)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: view.window)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupView() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTouchSaveButton))
        saveButton.tintColor = .white
        navigationItem.setRightBarButton(saveButton, animated: true)
        
        
        descriptionContainer.layer.borderColor = UIColor.lightGray.cgColor
        descriptionContainer.layer.borderWidth = 0.5
        descriptionContainer.layer.cornerRadius = 6.0
        descriptionContainer.layer.masksToBounds = true
        
        descriptionTextView.delegate = self
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        let frame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect
        bottomConstraint.constant = (frame?.height ?? 250) + 15
        UIView.animate(withDuration: duration?.doubleValue ?? 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber
        bottomConstraint.constant = 15
        UIView.animate(withDuration: duration?.doubleValue ?? 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func didTouchSaveButton() {
        view.endEditing(true)
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
        titleTextField.text = note.title
        descriptionTextView.text = note.description
    }
}

extension NoteViewerViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter?.descriptionDidChange(text: textView.text)
    }
}
