//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var synopsisTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var clearButton: UIButton!
    
    var book: Book? = nil
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        clearButton.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        clearButton.layer.borderWidth = 2
        clearButton.layer.cornerRadius = 15
        clearButton.backgroundColor = .systemGray3
        clearButton.titleLabel?.textColor = .black
        updateView(book: book)
    }
    
    func updateView(book: Book?){
        guard let book = book else {return}
        titleTextField.text = book.title
        authorTextField.text = book.author
        ratingTextField.text = String(book.rating)
        synopsisTextView.text = book.synopsis
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty,
              let author = authorTextField.text, !author.isEmpty,
              let rating = Double(ratingTextField.text ?? ""),
              let synopsis = synopsisTextView.text, !synopsis.isEmpty else {return}
        
        if let book = book {
            //update
            BookController.sharedInstance.updateBook(book: book, title: title, author: author, rating: rating, synopsis: synopsis)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            //make new
            BookController.sharedInstance.createBook(title: title, author: author, rating: rating, synopsis: synopsis)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        authorTextField.text = ""
        ratingTextField.text = ""
        synopsisTextView.text = ""
    }
}
