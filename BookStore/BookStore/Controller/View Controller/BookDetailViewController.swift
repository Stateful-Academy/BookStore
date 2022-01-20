//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Arian Mohajer on 1/20/22.
//

import UIKit

class BookDetailViewController: UIViewController {

    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var bookImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
}
