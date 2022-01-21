//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class BookDetailViewController: UIViewController, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    @IBOutlet weak var bookImageView: UIImageView!
    var defaultImage = UIImage()
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var ratingPickerView: UIPickerView!
    var ratingPickerData = [Double]()
    
    var book: Book? = nil
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Formatting the button - stretch goal #1
        clearButton.layer.borderColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        clearButton.layer.borderWidth = 2
        clearButton.layer.cornerRadius = 15
        clearButton.backgroundColor = .systemGray3
        clearButton.titleLabel?.textColor = .black
        
        //Implementing rating picker - stretch goal #2
        self.ratingPickerView.delegate = self
        self.ratingPickerView.dataSource = self
        ratingPickerData = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]
        
        guard let book = book else {return}
        updateView(book: book)
    }
    
    @IBAction func imageButtonTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: { () -> Void in
        })
        bookImageView.image = info[.originalImage] as? UIImage
        book?.bookImage = info[.originalImage] as? UIImage
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        11
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(ratingPickerData[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        
        switch row {
        case 0: ratingTextField.text = "0"
        case 1: ratingTextField.text = "0.5"
        case 2: ratingTextField.text = "1"
        case 3: ratingTextField.text = "1.5"
        case 4: ratingTextField.text = "2"
        case 5: ratingTextField.text = "2.5"
        case 6: ratingTextField.text = "3"
        case 7: ratingTextField.text = "3.5"
        case 8: ratingTextField.text = "4"
        case 9: ratingTextField.text = "4.5"
        case 10: ratingTextField.text = "5"
        default: ratingTextField.text = "0"
        }
    }
    
    func updateView(book: Book?){
        guard let book = book else {return}
        titleTextField.text = book.title
        authorTextField.text = book.author
        ratingTextField.text = String(book.rating)
        synopsisTextView.text = book.synopsis
        bookImageView.image = book.bookImage
        
        var row = 0
        switch book.rating {
        case 0: row = 0
        case 0.5: row = 1
        case 1.0: row = 2
        case 1.5: row = 3
        case 2.0: row = 4
        case 2.5: row = 5
        case 3.0: row = 6
        case 3.5: row = 7
        case 4.0: row = 8
        case 4.5: row = 9
        case 5.0: row = 10
        default: row = 0
        }

        ratingPickerView.selectRow(row, inComponent: 0, animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleTextField.text, !title.isEmpty,
              let author = authorTextField.text, !author.isEmpty,
              let rating = Double(ratingTextField.text ?? ""),
              let synopsis = synopsisTextView.text, !synopsis.isEmpty,
              let tempImage = bookImageView.image else {return}
        
        if let book = book {
            //update
            BookController.sharedInstance.updateBook(book: book, title: title, author: author, rating: rating, synopsis: synopsis, bookImage: tempImage)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            //make new
            BookController.sharedInstance.createBook(title: title, author: author, rating: rating, synopsis: synopsis, bookImage: tempImage)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        authorTextField.text = ""
        ratingTextField.text = ""
        synopsisTextView.text = ""
        bookImageView.image = defaultImage
        ratingPickerView.selectRow(0, inComponent: 0, animated: true)
    }
}
